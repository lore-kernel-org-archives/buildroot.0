From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Oct 2009 10:52:28 +0200
Subject: [Buildroot] [PATCH] package: netkitftp updates
In-Reply-To: <20091023083912.GG28436@openwide.fr> (Hugues Hiegel's message of
	"Fri\, 23 Oct 2009 10\:39\:12 +0200")
References: <1256243882-10748-1-git-send-email-hugues@hiegel.fr>
	<87d44fno90.fsf@macbook.be.48ers.dk>
	<20091023083912.GG28436@openwide.fr>
Message-ID: <87vdi6mr03.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hugues" == Hugues Hiegel <hugues.hiegel@openwide.fr> writes:

Hi,

 >> Thanks, but err - We don't actually have a netkitftp package, and I
 >> don't recall we ever had one. What tree is this patch against?

 Hugues> Mhmm... you're absolutely right !! I messed up between the official
 Hugues> buildroot and the branch I'm working on for a specific client..

 Hugues> So you should forget about it :o)

;)

 Hugues> ..unless you are interested by a netkitftp package ? :)
 Hugues> (I know busybox provides ftpget and ftpput, but I didn't find any 'ftp'
 Hugues> only command, based on 2009_08rc2 release.)

Sure, but I would strongly prefer you to convert it to the "new"
Makefile.autotools.in format instead.

-- 
Bye, Peter Korsgaard
