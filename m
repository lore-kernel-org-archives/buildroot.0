From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 20:12:34 +0100
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version
 7.2
In-Reply-To: <20210314160148.5425-1-texier.pj2@gmail.com> (Pierre-Jean
 Texier's message of "Sun, 14 Mar 2021 17:01:48 +0100")
References: <20210314160148.5425-1-texier.pj2@gmail.com>
Message-ID: <87zgyxr659.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <texier.pj2@gmail.com> writes:

 > - Fix CVE-2021-26530: The mg_tls_init function in Cesanta Mongoose HTTPS server 7.0
 >   (compiled with OpenSSL support) is vulnerable to remote OOB write attack via
 >   connection request after exhausting memory pool.
 > - Fix CVE-2021-26529: The mg_tls_init function in Cesanta Mongoose HTTPS server 7.0
 >   and 6.7-6.18 (compiled with mbedTLS support) is vulnerable to remote OOB write
 >   attack via connection request after exhausting memory pool.
 > - Fix CVE-2021-26528: The mg_http_serve_file function in Cesanta Mongoose HTTP server
 >   7.0 is vulnerable to remote OOB write attack via connection request after exhausting
 >   memory pool.

 > See https://github.com/cesanta/mongoose/releases/tag/7.2

Committed to 2021.02.x, thanks.

2020.02.x / 2020.11.x uses 6.x, but without mbedtls, so they are not
affected.

-- 
Bye, Peter Korsgaard
