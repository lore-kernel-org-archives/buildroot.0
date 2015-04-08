From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 19:29:24 +0200
Subject: [Buildroot] [PATCH v2 1/5] gcc-final: install libatomic
In-Reply-To: <552564A8.4050406@zacarias.com.ar>
References: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>
 <1428511969-28430-2-git-send-email-gustavo@zacarias.com.ar>
 <20150408191414.1fce04ac@free-electrons.com>
 <552564A8.4050406@zacarias.com.ar>
Message-ID: <20150408192924.0520195b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 08 Apr 2015 14:26:00 -0300, Gustavo Zacarias wrote:

> Actually it's already copied into staging, so i did't see any breakage
> at build time, but yes, runtime is a different story.
> Adding libatomic.so.* to LIB_EXTERNAL_LIBS in
> toolchain/toolchain-external/toolchain-external.mk is enough.
> I'll send a patch if this is the proper course of action, otherwise
> exclude webkit/midori for some external toolchains.

Is libatomic going to be provided by all toolchains on all
architectures?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
