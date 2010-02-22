From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 17:21:16 +0100
Subject: [Buildroot] [PATCH 18/38] package infrastructure: add PERLLIB
	and LD_LIBRARY_PATH
In-Reply-To: <51a8aa7821b9dc833ee40176f1b08f28dd2a69ca.1266774432.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 21 Feb 2010 18:46:56 +0100")
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<51a8aa7821b9dc833ee40176f1b08f28dd2a69ca.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878wali6mb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Now that we build Perl modules in $(HOST_DIR), PERLLIB must be defined
 Thomas> to $(HOST_DIR)/usr/lib/perl.

 Thomas> Moreover, several utilities built into $(HOST_DIR) depend on libraries
 Thomas> installed in $(HOST_DIR)/usr/lib. We must therefore pass the
 Thomas> appropriate LD_LIBRARY_PATH variable.

Same comment as the other one setting LD_LIBRARY_PATH - Perhaps the two
patches should get merged?
 
-- 
Bye, Peter Korsgaard
