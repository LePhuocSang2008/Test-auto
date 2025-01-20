import React from 'react';
import { useState } from 'react';

function ButtonTest({ onClick, children }) {
  const [message, setMessage] = useState('');

  const handleClick = () => {
    const obj = { message: 'Tao la trum', date: new Date() };
  setMessage(obj.message); // Cập nhật thông báo khi click // Gọi hàm onClick được truyền vào
  console.log(obj);
  
  };

  return (
    <div>
      <button onClick={handleClick}>{children}</button>
      {message && <p>{message}</p>} {/* Hiển thị thông báo nếu có */}
    </div>
  );
}

export default ButtonTest;