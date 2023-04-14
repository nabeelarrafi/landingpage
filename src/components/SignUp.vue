<template>
    <section id="signin">
        <div class="containers">
            <div class="user signinBx">
                <div class="imgBx"><img src="../assets/signin.jpg"></div>
                <div class="formBx">
                    <a href="/"><i class="bi bi-x-lg"></i></a>
                    <h2>Login</h2>
                    <div>
                        <input type="email" name="email" placeholder="Email" v-model="email" />
                        <span v-if="v$.email.$error" id="error">
                            {{ v$.email.$errors[0].$message }}
                        </span>

                        <input type="password" name="password" placeholder="Password" v-model="password" id="pass1" />
                        <span class="show-hide1"><i class="fa-solid fa-eye" id="show1" v-on:click="showHide1"></i></span>
                        <span v-if="v$.password.$error" id="error">
                            {{ v$.password.$errors[0].$message }}
                        </span>
                    </div>
                    <input type="submit" value="Login" v-on:click="login" />
                    <p class="signup">Don't have an account? <a href="#" v-on:click="toggleForm">Sign Up.</a></p>
                </div>
            </div>
            <div class="user signupBx">
                <div class="formBx">
                    <a href="/"><i class="bi bi-x-lg"></i></a>
                    <h2>Create An Account</h2>
                    <div>
                        <input type="email" name="email" placeholder="Email" v-model="email" />
                        <span v-if="v$.email.$error" id="error">
                            {{ v$.email.$errors[0].$message }}
                        </span>

                        <input type="password" name="password" placeholder="Create Password" v-model="password" id="pass2"/>
                        <span class="show-hide2"><i class="fa-solid fa-eye" id="show2" v-on:click="showHide2"></i></span>
                        <span v-if="v$.password.$error" id="error">
                            {{ v$.password.$errors[0].$message }}
                        </span>

                        <input type="password" name="cPassword" placeholder="Confirm Password" v-model="confirm" id="pass3"/>
                        <span class="show-hide3"><i class="fa-solid fa-eye" id="show3" v-on:click="showHide3"></i></span>
                        <span v-if="v$.confirm.$error" id="error">
                            {{ v$.confirm.$errors[0].$message }}
                        </span>
                    </div>
                    <input type="submit" value="Sign Up" v-on:click="signUp" />
                    <p class="signin">Already Have An Account? <a href="#" v-on:click="toggleForm">Login.</a></p>
                </div>
                <div class="imgBx"><img src="../assets/signup.jpg"></div>
            </div>
        </div>
    </section>
</template>

<script>
import axios from 'axios'
import useValidate from '@vuelidate/core'
import { required, email, minLength, sameAs } from '@vuelidate/validators'
import { baseAPI } from "../api.js"
export default {
    name : 'SignUp',
    data() {
        return {
            v$: useValidate(),
            email:"",
            password: "",
            confirm: "",
        };
    },
    validations() {
        return {
            email: { required, email },
            password: { required, minLength: minLength(8) },
            confirm: { required, sameAs: sameAs(this.password) }
        };
    },
    async mounted() {
        var kuki = $cookies.get("jwt")
        if (kuki) {
            this.$router.push({name : 'Home'})
        }
    },
    methods : {
        toggleForm() {
            var containers = document.querySelector('.containers')
            containers.classList.toggle('active')
        },
        async signUp() {
            try {
                this.v$.$validate();
                if (!this.v$.$error) {
                    let result = await axios.post(`${baseAPI}/signup`, {
                        email: this.email,
                        password: this.password,
                    });
                    if (result.status === 201) {
                        const Toast = this.$swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 2000,
                            timerProgressBar: true,
                        })

                        Toast.fire({
                            icon: 'success',
                            title: 'Sign Up Successfull!'
                        })
                        this.$router.push({name : 'SignUp'})
                        var containers = document.querySelector('.containers')
                        containers.classList.remove('active')
                    } 
                } else {
                    const Toast = this.$swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 2000,
                        timerProgressBar: true,
                    })

                    Toast.fire({
                        icon: 'error',
                        title: 'Sign Up Failed!'
                    })
                }
            } catch (error) {
                const Toast = this.$swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true,
                })

                Toast.fire({
                    icon: 'error',
                    title: error.response.data.message
                })
            }
        },
        async login() {
            try {
                this.v$.$validate();
                let result = await axios.post(`${baseAPI}/login`, {
                    email: this.email,
                    password: this.password,
                }, {withCredentials: true});
                if (result.status === 200 && result.data.status === "Success") {
                    const Toast = this.$swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 2000,
                        timerProgressBar: true,
                    })

                    Toast.fire({
                        icon: 'success',
                        title: 'Login Successfull!'
                    })
                    this.$router.push({name : 'Home'})
                } else {
                    const Toast = this.$swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 2000,
                        timerProgressBar: true,
                    })

                    Toast.fire({
                        icon: 'error',
                        title: 'Login Failed!'
                    })
                }
            } catch (error) {
                const Toast = this.$swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true,
                })

                Toast.fire({
                    icon: 'error',
                    title: error.response.data.message
                })
            }
        },
        showHide1() {
            const pass_field = document.querySelector('#pass1');
            const show_btn = document.querySelector('#show1');
            if (pass_field.type === "password") {
                pass_field.type = "text";
                show_btn.classList.add("hide");
            } else {
                pass_field.type = "password";
                show_btn.classList.remove("hide");
            }
        },
        showHide2() {
            const pass_field = document.querySelector('#pass2');
            const show_btn = document.querySelector('#show2');
            if (pass_field.type === "password") {
                pass_field.type = "text";
                show_btn.classList.add("hide");
            } else {
                pass_field.type = "password";
                show_btn.classList.remove("hide");
            }
        },
        showHide3() {
            const pass_field = document.querySelector('#pass3');
            const show_btn = document.querySelector('#show3');
            if (pass_field.type === "password") {
                pass_field.type = "text";
                show_btn.classList.add("hide");
            } else {
                pass_field.type = "password";
                show_btn.classList.remove("hide");
            }
        },  
    },
}
</script>

<style scoped>
/*===== Main ==== */
#error {
    font-size: 12px;
    color: red;
}

#signin {
    position: relative;
    min-height: 100vh;
    background-color: #FFC93C;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

#signin .containers {
    position: relative;
    background: #FFFFFF;
    width: 800px;
    height: 500px;
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}

#signin .containers .user {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
}
    
#signin .containers .user .imgBx {
    position: relative;
    width: 50%;
    height: 100%;
    background: #f1f1f1;
    transition: 0.5s;
}

#signin .containers .user .imgBx img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#signin .containers .user .formBx {
    position: relative;
    width: 50%;
    height: 100%;
    background: #fff;
    display: grid;
    justify-content: center;
    align-items: center;
    padding: 40px;
    transition: 0.5s;
}

#signin .containers .signinBx .formBx h2 {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 2px;
    text-align: center;
    width: 100%;
    margin-bottom: 10px;
    color: #3d3d3d;
}

#signin .containers .signinBx .formBx .bi-x-lg {
    position: absolute;
    top: 25px;
    right: 25px;
    font-size: 30px;
    opacity: 50%;
    color: #333;
}

#signin .containers .signupBx .formBx .bi-x-lg {
    position: absolute;
    top: 25px;
    left: 25px;
    font-size: 30px;
    opacity: 50%;
    color: #333;
}

#signin .containers .signupBx .formBx h2 {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 2px;
    text-align: center;
    width: 100%;
    margin-bottom: 10px;
    color: #ED950F;
}

#signin .containers .user .formBx input {
    position: relative;
    width: 100%;
    padding: 10px;
    background: #f5f5f5;
    color: #333;
    border: none;
    outline: none;
    box-shadow: none;
    margin: 8px 0;
    font-size: 14px;
    letter-spacing: 1px;
    font-weight: 300;
}

#signin .containers .signinBx .formBx input[type="submit"] {
    max-width: 100px;
    background: #3d3d3d;
    color: #fff;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: 0.5s;
}

#signin .containers .signupBx .formBx input[type="submit"] {
    max-width: 100px;
    background: #ED950F;
    color: #fff;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: 0.5s;
}
#signin .containers .user .formBx .signup {
    position: relative;
    margin-top: 20px;
    font-size: 12px;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: #575757;
    font-weight: 300px;
}

#signin .containers .user .formBx .signup a {
    font-weight: 600;
    color: #ED950F;
}

#signin .containers .user .formBx .signin {
    position: relative;
    margin-top: 20px;
    font-size: 12px;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: #575757;
    font-weight: 300px;
}

#signin .containers .user .formBx .signin a {
    font-weight: 600;
    color: #3d3d3d;
}

#signin .containers .signupBx {
    pointer-events: none;
}

#signin .containers.active .signupBx {
    pointer-events: initial;
}

#signin .containers .signinBx .formBx {
    left: 0;
}

#signin .containers.active .signinBx .formBx {
    left: 100%;
}

#signin .containers .signinBx .imgBx {
    left: 0;
}

#signin .containers.active .signinBx .imgBx {
    left: -100%;
}

#signin .containers .signupBx .formBx {
    left: 100%;
}

#signin .containers.active .signupBx .formBx {
    left: 0;
}

#signin .containers .signupBx .imgBx {
    left: -100%;
}

#signin .containers.active .signupBx .imgBx {
    left: 0;
}

.show-hide1 i {
    position: absolute;
    color: rgb(71, 71, 71, 0.6);
    right: 55px;
    top: 247px;
    cursor: pointer;
    display: block;
    transform: translateY(-50%);
}

.show-hide2 i {
    position: absolute;
    color: rgb(71, 71, 71, 0.6);
    right: 55px;
    top: 219px;
    cursor: pointer;
    display: block;
    transform: translateY(-50%);
}

.show-hide3 i {
    position: absolute;
    color: rgb(71, 71, 71, 0.6);
    right: 55px;
    top: 276px;
    cursor: pointer;
    display: block;
    transform: translateY(-50%);
}

.show-hide1 i:hover, 
.show-hide2 i:hover, 
.show-hide3 i:hover {
   color: #000; 
}

.show-hide1 i.hide:before, 
.show-hide2 i.hide:before, 
.show-hide3 i.hide:before {
    content: '\f070';
}

/*===== Tablet Responsive  */
@media (min-width: 768px) and (max-width: 900px) {
    #signin .containers {
        max-width: 590px;
    } 

    .show-hide1 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 55px;
        top: 238px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }

    .show-hide2 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 55px;
        top: 210px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }

    .show-hide3 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 55px;
        top: 267px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }
}

/*===== Universal Phone Responsive =====*/
@media (max-width: 426px) {
    #signin .containers {
        max-width: 590px;
    }

    #signin .containers .imgBx {
        display: none;
    }

    #signin .containers .user .formBx {
        width: 100%;
    }
}

/*===== Phone L Responsive  */
@media (min-width: 425px) and (max-width: 600px) {
    #signin .containers .signupBx .formBx .bi-x-lg, 
    #signin .containers .signinBx .formBx .bi-x-lg {
        position: absolute;
        top: 20px;
        left: 330px;
        font-size: 30px;
        opacity: 50%;
        color: #333;
    }
}

/*===== Phone M Responsive  */
@media (min-width: 350px) and (max-width: 424px) {
    #signin .containers .signupBx .formBx .bi-x-lg, 
    #signin .containers .signinBx .formBx .bi-x-lg {
        position: absolute;
        top: 20px;
        left: 280px;
        font-size: 30px;
        opacity: 50%;
        color: #333;
    }
}

/*===== Phone S Responsive  */
@media (max-width: 374px) {
    #signin .containers .signupBx .formBx .bi-x-lg, 
    #signin .containers .signinBx .formBx .bi-x-lg {
        position: absolute;
        top: 20px;
        left: 225px;
        font-size: 30px;
        opacity: 50%;
        color: #333;
    }

    .show-hide1 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 50px;
        top: 238px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }

    .show-hide2 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 50px;
        top: 220px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }

    .show-hide3 i {
        position: absolute;
        color: rgb(71, 71, 71, 0.6);
        right: 50px;
        top: 277px;
        cursor: pointer;
        display: block;
        transform: translateY(-50%);
    }
}
</style>