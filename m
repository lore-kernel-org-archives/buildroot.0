From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Dec 2011 16:44:40 +0100
Subject: [Buildroot] [PATCH 1/1] libosip2 : bump version.
In-Reply-To: <20111212162722.14634b32@skate> (Thomas Petazzoni's message of
 "Mon, 12 Dec 2011 16:27:22 +0100")
References: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
 <87liqhu8tr.fsf@macbook.be.48ers.dk> <20111212162722.14634b32@skate>
Message-ID: <87hb15u74n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 12 Dec 2011 16:08:00 +0100,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Either use the real upstream or change to a stable snapshot.debian.org
 >> URL.

 Thomas> Generally speaking, I think we should refuse to use URLs on
 Thomas> ftp.debian.org. Those are *always* changing all the time, and have
 Thomas> already broken the build for numerous packages. They are also causing
 Thomas> problems to people using old versions of Buildroot.

Indeed. They should only be used when upstream is dead, and in those
cases the stable snapshot.debian.org URLs used instead.

-- 
Bye, Peter Korsgaard
