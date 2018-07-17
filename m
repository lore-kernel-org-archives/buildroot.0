From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Jul 2018 22:23:11 +0200
Subject: [Buildroot] [RFC v2 1/4] meson: bump version to 0.47.1
In-Reply-To: <20180717191605.19263-1-ps.report@gmx.net>
References: <20180717191605.19263-1-ps.report@gmx.net>
Message-ID: <20180717202311.GA29739@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-07-17 21:16, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
> Hash not checked against the pgp signature, tried
> 	$ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
>   gpg: Signature made Di 10 Jul 2018 23:28:12 CEST
>   gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
>   gpg: Can't check signature: No public key
>
> Any advice which public key is used to sign the meson package?

I check the signature as follows:

```
$ gpg --recv-keys 3BF4693BFEEB9428
$ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
gpg: Signature made Tue Jul 10 23:28:12 2018 CEST using RSA key ID
FEEB9428
gpg: Good signature from "Jussi Pakkanen <jpakkane@gmail.com>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the
owner.
Primary key fingerprint: 9518 1F4E ED14 FDF4 E41B  518D 3BF4 693B FEEB
9428
```

BTW, shouldn't a signed-off-by line be added to the refreshed patch? I
was about to send this package bump, so I can send mine if you want.

Regards,

--
ELB
