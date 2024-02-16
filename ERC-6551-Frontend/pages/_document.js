import Document, { Html, Head, Main, NextScript } from "next/document";
import { countLoad } from "../assets/scss/counter";

const APP_NAME = "Net2Dev ERC6551 Front-End";

class MyDocument extends Document {
  static async getInitialProps(ctx) {
    countLoad()
    return await Document.getInitialProps(ctx);
  }

  render() {
    return (
      <Html lang="en">
        <Head>
          <meta charSet="utf-8" />
          <meta name="apple-mobile-web-app-title" content={APP_NAME} />
          <link legacybehavior="true"
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Open+Sans:wght@400;600&display=swap"
            rel="stylesheet"
          />
        </Head>
        <body className="dark-bg">
          <Main />
          <NextScript />
        </body>
      </Html>
    );
  }
}

export default MyDocument;
