import React from "react";
import Head from "next/head";

const Layout = ({ children, title, desc }) => {
  return (
    <div>
      <Head>
        <title>
          {title
            ? `Net2Dev | ${title}`
            : "Net2Dev ERC6551 Wallet Page"}
        </title>
        {desc && <meta name="description" content={desc} />}
      </Head>

      <div className="main-wrapper">{children}</div>
    </div>
  );
};

export default Layout;
