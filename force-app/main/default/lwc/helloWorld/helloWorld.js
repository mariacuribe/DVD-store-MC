import { LightningElement} from 'lwc';
import sendMail from '@salesforce/apex/EmailManager.sendMail';

export default class ButtonBasic extends LightningElement {
    
    clickedButtonLabel;
    emailInserted;

    handleClick(event) {
        sendMail({address: this.emailInserted, subject: '50% Discount on your next visit!', body: 'Dear customer, thank you for renting movies with us. Present this Email on your next visit and get a 50% discount on your next movie.'})
        .then(result => {console.log('succesful')}, error=>console.error(error))
        .catch(error => {console.log('Error: ', error)})
    }

    handleChange(event){
        console.log(event.target.value);
        this.emailInserted=event.target.value;
    }

}