From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Tue, 23 Jun 2020 09:50:11 +0000
Subject: [Buildroot] [PATCH] package/gnutls: security bump to 3.6.14
In-Reply-To: <87r1u884ix.fsf@dell.be.48ers.dk>
References: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
 <87r1u884ix.fsf@dell.be.48ers.dk>
Message-ID: <8c99675d35b8e58db6bcb1cae990f386be12e616.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2020-06-21 at 23:58 +0200, Peter Korsgaard wrote:
> > > > > > "stefan" == stefan  <stefan@astylos.dk> writes:
>
>  > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
>  > Fixes the following security issue:
>
>  >  * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
>  >    regression in the TLS protocol implementation. This caused the
> TLS
>  >    server to not securely construct a session ticket encryption key
>  >    considering the application supplied secret, allowing a MitM
>  >    attacker to bypass authentication in TLS 1.3 and recover
> previous
>  >    conversations in TLS 1.2
>
>  > Release announcement:
>  >
> https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html
>
>  > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
>
> Did you test this on uClibc? I had a look at bumping the version
> earlier
> this month and ended up with build issues because of a gnulib update:

I thought I did, but somehow I managed to mess it up an get a successful
build.

I will look into it.

Stefan


Spectralink Disclaimer:
"The information transmitted by this email is intended only for the person or entity to which it is addressed. This email may contain proprietary, confidential and/or privileged material. If you are not the intended recipient of this message, please notify the sender by reply email immediately and delete this message without reading further or forwarding to others. The contents of this email may be protected by copyright law. This email is not intended to be a contract or other legally binding obligation".
