From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:50:22 +0100
Subject: [Buildroot] [PATCH 1/1] gpm: run autogen.sh as PRE_CONFIGURE
	step
In-Reply-To: <1391506737-16469-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Tue, 4 Feb 2014 10:38:57 +0100")
References: <1391506737-16469-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <874n4fi4v5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > Move the GPM_RUN_AUTOGEN to be a PRE_CONFIGURE step because this step
 > depends on the dependancies being built. If it is a POST_PATCH step
 > the dependancies won't be built and the GPM_RUN_AUTOGEN step will fail.

Committed, thanks.

-- 
Bye, Peter Korsgaard
