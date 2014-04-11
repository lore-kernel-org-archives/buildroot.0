From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Apr 2014 16:00:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-10
In-Reply-To: <20140411145923.21a38b08@skate> (Thomas Petazzoni's message of
 "Fri, 11 Apr 2014 14:59:23 +0200")
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
 <20140411065158.0a9308de@core2quad.morethan.org>
 <20140411141346.49e1251a@skate> <20140411123931.GZ4096@tarshish>
 <20140411145923.21a38b08@skate>
Message-ID: <87r4543r0z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Aah, exactly! Except that the download was not interrupt by doing a
 > Ctrl+C, and it's actually wget which retried the download. And:

 > 2014-04-08 04:27:12 (3.70 MB/s) - Connection closed at byte 1057288. Retrying.

 > The size at which the download was interrupted matches exactly my
 > findings.

 > Is it a bug in wget? Some option we forgot to pass to wget?

Seems like a bug to me. I don't see how this could ever be valid
behaviour.

-- 
Bye, Peter Korsgaard
