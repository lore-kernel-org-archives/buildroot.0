From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Aug 2013 15:30:33 +0200
Subject: [Buildroot] MesaLib
In-Reply-To: <20130829102659.6240bcb9@skate> (Thomas Petazzoni's message of
 "Thu, 29 Aug 2013 10:26:59 +0200")
References: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
 <20130829102659.6240bcb9@skate>
Message-ID: <87mwo0fwue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Should 7.10.3 be in the repository or is the buildroot source wrong?

 Thomas> The sources.buildroot.net mirror is updated only when a Buildroot
 Thomas> release is made. The last stable release is currently 2013.05, which
 Thomas> was using MesaLib 7.10.1, which explains why it is available from our
 Thomas> mirror.

 Thomas> The bump to 7.10.3 was done by commit
 Thomas> 53cea4462c67a6707bf8dad83fa928262e44fce9 in June 2013, i.e after the
 Thomas> 2013.05 release. Since the 2013.08 release hasn't been made yet, I
 Thomas> believe Peter has not updated the Buildroot mirror, and therefore it
 Thomas> doesn't contain for the moment all the new versions of the tarballs
 Thomas> that have been upgraded since 2013.05.

Actually I update it once a week (wednesdays), but it seems like
allyespackageconfig doesn't pick up the modular X11 parts (E.G. mesa).

I've now added them manually.

-- 
Bye, Peter Korsgaard
