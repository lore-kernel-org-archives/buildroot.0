From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Dec 2010 21:33:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.package.in: Added BZR
	download support
In-Reply-To: <20101226102155.04f7171f@surf> (Thomas Petazzoni's message of
	"Sun, 26 Dec 2010 10:21:55 +0100")
References: <cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<ac294cf557f0d6053373d9af3471300a12f28d1c.1293210451.git.thomas.petazzoni@free-electrons.com>
	<878vzdpjt8.fsf@macbook.be.48ers.dk> <20101226102155.04f7171f@surf>
Message-ID: <87ei93negq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Shouldn't this make a tarball like the git/svn versions do?

 Thomas> I was also a little bit surprised, but bzr export creates a tarball
 Thomas> automatically.

 Thomas> I have tested those two patches by creating a simple package that gets
 Thomas> its source from BZR, and it worked properly (tarball created in
 Thomas> $(DL_DIR), and re-used at the next build).

Ok, thanks both - I'll pull it then.

-- 
Bye, Peter Korsgaard
