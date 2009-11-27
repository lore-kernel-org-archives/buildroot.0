From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Nov 2009 20:42:07 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <op.u32h8vtpyqa4qb@jap-lappis> (Joachim Pihl's message of "Fri\,
	27 Nov 2009 20\:11\:09 +0100")
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk> <op.u32e97xjyqa4qb@jap-lappis>
	<87k4xb6dk2.fsf@macbook.be.48ers.dk> <op.u32gvtv4yqa4qb@jap-lappis>
	<87fx7z6bt3.fsf@macbook.be.48ers.dk> <op.u32h8vtpyqa4qb@jap-lappis>
Message-ID: <87bpin69gw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 >> Ahh yes, you have to select 2.6.27.x in the choice box above instead of
 >> typing the string (Where you have now 'manually selected version')
 >> 

 Joachim> No such setting in xconfig... Only 2.6.30, 2.6.31, snapshot
 Joachim> and manual

You'll have to enable BR2_DEPRECATED to see such an old kernel
(Build options->Show packages that are deprecated or obsolete)

-- 
Bye, Peter Korsgaard
