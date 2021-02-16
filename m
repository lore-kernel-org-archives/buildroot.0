From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:40:55 +0100
Subject: [Buildroot] [PATCH 2/3] package/mongoose: security bump to
 version 7.1
In-Reply-To: <20210216080756.1635858-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 16 Feb 2021 09:07:55 +0100")
References: <20210216080756.1635858-1-fontaine.fabrice@gmail.com>
 <20210216080756.1635858-2-fontaine.fabrice@gmail.com>
Message-ID: <87lfbn94xk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-26528: The mg_http_serve_file function in Cesanta
 >   Mongoose HTTP server 7.0 is vulnerable to remote OOB write attack via
 >   connection request after exhausting memory pool.
 > - Fix CVE-2021-26529: The mg_tls_init function in Cesanta Mongoose HTTPS
 >   server 7.0 and 6.7-6.18 (compiled with mbedTLS support) is vulnerable
 >   to remote OOB write attack via connection request after exhausting
 >   memory pool.
 > - Fix CVE-2021-26530: The mg_tls_init function in Cesanta Mongoose HTTPS
 >   server 7.0 (compiled with OpenSSL support) is vulnerable to remote OOB
 >   write attack via connection request after exhausting memory pool.

 > https://github.com/cesanta/mongoose/releases/tag/7.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
