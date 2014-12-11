From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:54:00 +0100
Subject: [Buildroot] [PATCH 0/8] Improving static/shared library
 selection
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211225400.6c4c5a16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Dec 2014 22:41:27 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (8):
>   docs: fix typo in cmake-package documentation

This one was already applied.

>   Rename BR2_PREFER_STATIC_LIB to BR2_STATIC_LIBS
>   arch: FDPIC is not supported on m68k
>   arch: ensure BR2_BINFMT_ELF is really used
>   arch: introduce BR2_BINFMT_SUPPORTS_SHARED
>   ncurses: speed up host build by disabling static library building

I've applied up to this point now.

>   Turn the static lib option into a choice with more options
>   Build shared libraries only as the default

I'll respin those two ones, because Yann had comments.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
