export const VDocumentCaptureConfig = {
  get: () => convertKeysToLowerCase(configuration()),
};

const configuration = () => ({
  closeButton: 'YES',
  obverseFlash: 'NO',
  ...translations(),
  ...colors(),
});

const translations = () => ({
  badQualityPictureInfo: 'Imagen en mala calidad',
});

const colors = () => ({
  arrowColor1: '#ff0000',
  arrowColor2: '#ff2e2e',
  arrowColor3: '#ff5c5c',
  arrowColor4: '#ff7d7d',
  arrowColor5: '#ffa1a1',
});

const convertKeysToLowerCase = obj =>
  Object.entries(obj).reduce(
    (map, [key, value]) => ({...map, [key.toLowerCase()]: value}),
    {},
  );
