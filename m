From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 18:56:21 -0300
Subject: [Buildroot] [PATCH v2] openssl: bump to 1.0.0e
In-Reply-To: <4E67629E.10809@visionsystems.de>
References: <4E67629E.10809@visionsystems.de>
Message-ID: <c27c7362b68628f7b2dc90bcc2cb3c4b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 07 Sep 2011 14:25:02 +0200, Yegor Yefremov wrote:

> Changes between 1.0.0d and 1.0.0e [6 Sep 2011]
>
>   *) Fix bug where CRLs with nextUpdate in the past are sometimes 
> accepted
>      by initialising X509_STORE_CTX properly. (CVE-2011-3207)
>      [Kaspar Brand <ossl@velox.ch>]
>
>   *) Fix SSL memory handling for (EC)DH ciphersuites, in particular
>      for multi-threaded use of ECDH. (CVE-2011-3210)
>      [Adam Langley (Google)]
>
>   *) Fix x509_name_ex_d2i memory leak on bad inputs.
>      [Bodo Moeller]
>
>   *) Remove hard coded ecdsaWithSHA1 signature tests in ssl code and 
> check
>      signature public key algorithm by using OID xref utilities 
> instead.
>      Before this you could only use some ECC ciphersuites with SHA1 
> only.
>      [Steve Henson]
>
>   *) Add protection against ECDSA timing attacks as mentioned in the 
> paper
>      by Billy Bob Brumley and Nicola Tuveri, see:
>
> 	http://eprint.iacr.org/2011/232.pdf
>
>      [Billy Bob Brumley and Nicola Tuveri]
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
