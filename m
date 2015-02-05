From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 17:16:55 +0100
Subject: [Buildroot] grub2 failure with gcc-4.9
In-Reply-To: <54D39711.6010405@free.fr>
References: <54D367F9.4060108@free.fr>
 <20150205142015.4318baa2@free-electrons.com>
 <54D39711.6010405@free.fr>
Message-ID: <20150205171655.4ca05d04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 05 Feb 2015 17:15:13 +0100, Thierry Bultel wrote:

> With gcc-4.9 from Ubuntu
> 
> (in grub2.mk, I set TARGET_CC="/usr/bin/gcc" \
> 	TARGET_CFLAGS="-m32" \
> )
> 
> ... grub hangs.

Seems like you're good for a bug report to the upstream project. I
checked their Git repo, there is a gcc 4.9 fix but specific for ARM
issues. I haven't seen any other commit mentioning "4.9".

You may want to try with their latest Git version first, though, just
in case the problem was fixed but not mentioned explicitly in a commit
log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
