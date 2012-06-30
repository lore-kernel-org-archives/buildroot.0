From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Jun 2012 23:53:46 +0200
Subject: [Buildroot] [PATCH] dependencies: ensure that DESTDIR isn't set
	when running Buildroot
In-Reply-To: <1340964896-12899-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 Jun 2012 12:14:56 +0200")
References: <1340964896-12899-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878vf44gb9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Having DESTDIR set in the environment before running Buildroot creates
 Thomas> some funky problems in the build process. Prevent users from running
 Thomas> into this kind of troubles.

Committed, thanks.

-- 
Bye, Peter Korsgaard
