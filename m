From: tochansky at tochlab.net <tochansky@tochlab.net>
Date: Thu, 15 Nov 2018 19:07:43 +0000
Subject: [Buildroot] version `GLIBC_2.27' not found
In-Reply-To: <20181115162037.6a4f2208@windsurf>
References: <20181115162037.6a4f2208@windsurf>
 <a59aa43d9d9f5a8e734185c9efd73c75@tochlab.net>
Message-ID: <d58e4fe6a02db152b13723aa730b9768@tochlab.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

15 ?????? 2018 ?., 18:20, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com> ???????:

> It depends on the glibc symbols they use. You need to build your
> toolchain on a system that has a glibc <= 2.23.
I found that glibc was updated on gentoo to 2.27 few days ago, that's why I haven't see this problem before. Thanks for clarification, I was afraid that something goes wrong.
 
> You can also have a look at the pre-built toolchains available at
> https://toolchains.bootlin.com, we build them in chroots with old
> system, specifically to make them as compatible as possible. The
> "stable" toolchains are currently built inside a Debian Squeeze chroot,
> while the "bleeding-edge" toolchains are built inside a Debian Jessie
> chroot, because gdb 8.0 requires a C++11 capable compiler.
Thanks for useful link, Thomas.

--
D
