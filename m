From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 23:33:02 +0200
Subject: [Buildroot] [PATCH] glibc: Pass correct -mabi for MIPS
In-Reply-To: <1380121257-10449-1-git-send-email-markos.chandras@imgtec.com>
References: <1380121257-10449-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20131001233302.73a5245f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 25 Sep 2013 16:00:57 +0100, Markos Chandras wrote:
> According to glibc-2.18/ports/sysdeps/mips/preconfigure,
> if no -mabi was passed to CFLAGS, then it defaults to -mabi=n32.
> This breaks o32 and n64 builds for MIPS64. Therefore, it is
> necessary to append -mabi to CFLAGS.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
