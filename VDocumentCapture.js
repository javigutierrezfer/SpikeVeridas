import {NativeEventEmitter, NativeModules} from 'react-native';
import {VDocumentCaptureConfig} from './VDocumentCaptureConfig';

const {DocumentCaptureModule} = NativeModules;

export class VDocumentCapture {
  start = () => {
    console.log('**** Entra');
    const eventEmitter = new NativeEventEmitter(DocumentCaptureModule);

    this.onDocumentImageSubscription = eventEmitter.addListener(
      'DocumentCapture.onDocumentImage',
      capture => console.log('**** Imagen: ', capture.type),
    );
    this.onFinishSubscription = eventEmitter.addListener(
      'DocumentCapture.onFinish',
      () => {
        console.log('***** Documento Capturado');
        this.onDocumentImageSubscription.remove();
        this.onFinishSubscription.remove();
      },
    );

    DocumentCaptureModule.start(['ES_IDCard_2006', 'ES_IDCard_2015'], {
      closebutton: 'YES',
    });
  };
}
