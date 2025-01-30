import * as request from 'supertest';


describe('AppController (e2e)', () => {
  const deploymentUrl = process.env.DEPLOYMENT_URL || 'http://localhost:3000';

  it('/hello (GET)', () => {
    return request(deploymentUrl)
      .get('/hello')
      .expect(200)
      .expect('Hello World!');
  });
});
