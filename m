From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Apr 2012 10:23:15 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <201204211505.51141.arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 21 Apr 2012 15:05:50 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
 <201204211505.51141.arnout@mind.be>
Message-ID: <871ungi39o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Tuesday 17 April 2012 16:45:13 Thomas Petazzoni wrote:
 >> This variable was only used by uboot.mk to add a #define DATE into the
 >> U-Boot .h configuration file. But such a definition does not seem to
 >> be used by the mainline U-Boot, so there's no reason to keep it.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Arnout> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Arnout>  This patch could be considered risky, because the DATE thing
 Arnout> may be used by some custom U-Boot source.  But then, the only
 Arnout> way to find out if it is is to commit it and see if anyone
 Arnout> complains :-)

I know we have been (are?) using it at work to add some info about the
build date and name some files with the date.

Chances are others might have been doing the same, so I'm hessitating
about removing it (which is why I didn't commit it right away). It
doesn't really cost us much to keep it (single line).

-- 
Bye, Peter Korsgaard
