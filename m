From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Oct 2013 15:08:00 +0200
Subject: [Buildroot] [PATCH v7 3/6] package/Makefile.in: don't force
	jobs when BR2_JLEVEL is empty
In-Reply-To: <524DA137.304@mind.be> (Arnout Vandecappelle's message of "Thu,
 03 Oct 2013 18:54:15 +0200")
References: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
 <1380802245-16978-4-git-send-email-fabio.porcedda@gmail.com>
 <524DA137.304@mind.be>
Message-ID: <87zjqpjia7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 10/03/13 14:10, Fabio Porcedda wrote:
 >> When the "BR2_JLEVEL" variable is empty use "make" without
 >> the "-j" option, because to be able to use top-level parallel
 >> make we must don't force the number of jobs in sub-make.
 >> 
 >> Example:
 >> make BR2_JLEVEL= -j8
 >> 
 >> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 >> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Arnout>  Peter, can we get this committed?

Yes, committed - Thanks.

-- 
Bye, Peter Korsgaard
