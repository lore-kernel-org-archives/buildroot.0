From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Sep 2017 14:27:49 +0300
Subject: [Buildroot] OpenSSH build error against master
In-Reply-To: <CA+h8R2qCu0MTSeX6AATVhHJOOC3O1T7_DvX=87xXY1da_U6XRQ@mail.gmail.com>
References: <CA+h8R2qCu0MTSeX6AATVhHJOOC3O1T7_DvX=87xXY1da_U6XRQ@mail.gmail.com>
Message-ID: <20170920112749.lvri5o7tjbwztkqk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Wed, Sep 20, 2017 at 11:51:42AM +0100, Christian Stewart wrote:
> Once again running under Gentoo:
> 
> configure: error: No crypto library found!
> Try --with-libssl-prefix=PATH
>  or --with-libgcrypt-prefix=PATH
>  or --with-libmbedtls-prefix=PATH
>  or --with-wincng on Windows
> 
> This is for libssh2-1.8.0 on upstream/master commit 85f11d.
> 
> I have libssl 1.0.2l on my machine.

What is your .config?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
