From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 22:47:13 +0200
Subject: [Buildroot] [PATCH] fontconfig: bump to version 2.11.1
In-Reply-To: <1401402692-12744-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Fri, 30 May 2014 00:31:32 +0200")
References: <1401402692-12744-1-git-send-email-ps.report@gmx.net>
Message-ID: <87egzb804u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes misinstallation of xfont_font-bh-ttf-1.0.3/42-luxi-mono.conf to
 > 'target at baseconfigdir@/conf.avail/42-luxi-mono.conf'
 > instead of proper place in the target directory (because of buggy
 > fontconfig.pc file).

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
