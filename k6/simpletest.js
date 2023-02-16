import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
  http.get("http://<domain name of ALB>");
  sleep(1);
}