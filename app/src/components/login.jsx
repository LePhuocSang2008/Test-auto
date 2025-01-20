import React, { useState } from "react"

function Login({ onLogin}) {

    const [userName, setUserName] = useState('');
    const [passWord, setPassword] = useState('');
    const [error, setError] = useState('');

    const handlSubmit = (e) => {
    e.preventDefault()
        if (userName === 'user' && passWord === 123) {
           setError('')
          
        } else {
            setError('Sai cmm rồi')
      }
    }

    return <>
        <form onSubmit={handlSubmit}>
      <input
        type="text"
          placeholder="userName"
          name="userName"
        value={userName}
        onChange={(e) => setUserName(e.target.value)}
      />
      <input
        type="passWord"
          placeholder="passWord"
          name="passWord"
        value={passWord}
        onChange={(e) => setPassword(e.target.value)}
      />
      <button name="login_button" type="submit">Login</button>
      {error && <p>{error}</p>} {/* Hiển thị thông báo lỗi nếu có */}
    </form>
    </>
}

export default Login