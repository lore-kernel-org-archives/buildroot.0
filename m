From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 22:09:50 +0100
Subject: [Buildroot] [PATCH] matchbox-desktop: fix link issue against
	libdl
In-Reply-To: <1355863126-17526-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Dec 2012 21:38:46 +0100")
References: <1355863126-17526-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9tbm5i9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> matchbox-desktop uses dlopen(), so it needs to link against libdl. The
 Thomas> configure.ac and Makefile.am have the necessary provisions to do so,
 Thomas> but the included configure script does not replace LIBADD_DL in
 Thomas> src/Makefile.am as it should.

 Thomas> Therefore, we force the autoreconf of the package, which solves the
 Thomas> problem.

Committed, thanks.

-- 
Bye, Peter Korsgaard
