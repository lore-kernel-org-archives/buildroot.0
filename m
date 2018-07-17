From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Jul 2018 23:02:32 +0300
Subject: [Buildroot] [RFC v2 1/4] meson: bump version to 0.47.1
In-Reply-To: <20180717191605.19263-1-ps.report@gmx.net>
References: <20180717191605.19263-1-ps.report@gmx.net>
Message-ID: <87o9f5636v.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Seiderer writes:

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

The key ID is shown in the message above. You can import the key and
verify with:

  gpg --recv-keys 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
  gpg --verify meson-0.47.1.tar.gz.asc

gpg: Signature made Wed 11 Jul 2018 12:28:12 AM IDT
gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
gpg: Good signature from "Jussi Pakkanen <jpakkane@gmail.com>" [marginal]

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
