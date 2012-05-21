From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 21 May 2012 10:46:56 +0200
Subject: [Buildroot] Using custom x-loader,
	u-boot and kernel within buildroot
In-Reply-To: <CAHvj1qbPy98MDBP5xReYT7-ctb9+nQFqc1TO-MXpYJqM4GjZbA@mail.gmail.com>
References: <CAHvj1qbPy98MDBP5xReYT7-ctb9+nQFqc1TO-MXpYJqM4GjZbA@mail.gmail.com>
Message-ID: <CAGm1_kvqUe2xzXWGNptzQpaQx7Terd-ede-tAgfew4UstFiAew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I was wondering if I could ask for some tips to implement a custom
> x-loader and u-boot into my buildroot environment?
>
> I need to build using the x-loader and u-boot from this git repository:
> https://gitorious.org/ap-module-dm37
>
> I think I understand adding the kernel part, I simply use a custom tar
> ball etc....but I'm struggling with the x-loader and u-boot. With
> u-boot I think I can also use a custom tar ball......but MLO comes
> from u-boot....yet the above git repo has x-loader as separate?

Is your u-boot SPL ready (i.e. produces both binaries MLO and
u-boot.img)? Or can you at least use upstream u-boot?

Yegor
