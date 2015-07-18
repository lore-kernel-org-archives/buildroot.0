From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:53:42 +0200
Subject: [Buildroot] [PATCH] libsigsegv: unavailable for powerpc with
 uclibc
In-Reply-To: <55A6527C.8000206@zacarias.com.ar>
References: <1436191311-23939-1-git-send-email-gustavo@zacarias.com.ar>
 <20150706173812.113b4336@free-electrons.com>
 <20150715110110.23ba4d7f@free-electrons.com>
 <55A6527C.8000206@zacarias.com.ar>
Message-ID: <20150718235342.6de37530@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed, 15 Jul 2015 09:30:52 -0300, Gustavo Zacarias wrote:

> There's a whole set of different arch combinations for musl that don't 
> seem to build, it needs a whole lot of build testing to get an accurate 
> list.

Ok, so let's wait to handle the musl situation. I'm waiting for the ARM
musl and x86-64 musl configurations to stabilize a bit in the
autobuilders before adding more musl toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
