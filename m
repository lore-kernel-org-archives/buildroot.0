From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:32:16 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix lib64 symlinks
In-Reply-To: <CAG2jQ8iVYt=QK9s4sKKzbCsRvp=rA4_BjPSg0DnTQtOobOtn4A@mail.gmail.com>
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
 <CAG2jQ8iVYt=QK9s4sKKzbCsRvp=rA4_BjPSg0DnTQtOobOtn4A@mail.gmail.com>
Message-ID: <20130813113216.5e29331a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 13 Aug 2013 09:37:37 +0100, Markos Chandras wrote:

> Again, this should also handle the MIPS64/n32 case where lib32 is
> needed instead of lib or lib64
> 
> Thomas suggested to have new symbols like ARCH_NEEDS_LIB32 or
> ARCH_NEEDS_LIB64 selected by architectures that need lib32->lib or
> lib64->lib symlinks respectively.

Right, at least I wanted this to be explored.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
