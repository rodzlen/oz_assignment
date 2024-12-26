// 제출 이벤트 받기
const form = document.getElementById('form')

form.addEventListener('submit', function(event){
    event.preventDefault()
    let userId = event.target.id.value
    let userPw1 = event.target.pw1.value
    let userPw2= event.target.pw2.value
    let userName = event.target.name.value
    let userPhone = event.target.phone.value
    let userJob = event.target.job.value
    let userGender = event.target.gender.value
    let userEamil = event.target.email.value
    
    if (userId < 4 ){
        alert("아이디는 4자리 이상 입력해주세요")
        return;
    }
    if(userPw1 !== userPw2){
        alert('비밀번호가 일치하지 않습니다.')
        return;
    }
    const p = document.createElement('p')
    p.textContent = userId
    document.append(p)
})
