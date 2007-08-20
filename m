From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 19:39:40 +0200
Subject: [Buildroot] stdarg.h error
In-Reply-To: <50f131690708200938t13f4ae3dn12d12933ba6b6f24@mail.gmail.com>
References: <50f131690708200938t13f4ae3dn12d12933ba6b6f24@mail.gmail.com>
Message-ID: <20070820173938.GP11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2007 at 01:38:08PM -0300, Emiliano Lopez wrote:
>Hi to all.
>I am trying to port linux on a routerboard 532 [1].
>Actually I am having problems to compile the kernel.
>
>I am using buildroot-20050818 download from [2] because y need to
>compile a kernel version 2.4.30 or 2.4.31.

Does a current buildroot with a current toolchain, current uclibc-0.9.29
and a current kernel work? If it does not, what error do you get (please
provide your br2.config and your uClibc.config in this case)
