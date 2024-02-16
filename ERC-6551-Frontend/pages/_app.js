import Head from "next/head";
import "bootstrap/dist/css/bootstrap.min.css";
import Script from "next/script";
import { Fragment } from "react";
import "../assets/scss/main.scss";
import "swiper/css";
import "react-modal-video/scss/modal-video.scss";

function MyApp({ Component, pageProps }) {
  return (
    <Fragment>
      <Script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
      ></Script>
      <Head>
        <meta
          name="viewport"
          content="minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no, viewport-fit=cover"
        />
      </Head>
      <Component {...pageProps} />
    </Fragment>
  );
}

export default MyApp;
