From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2014 09:19:44 +0200
Subject: [Buildroot] [PATCHv2 5/7] gcc/4.7: fix C++ exceptions and
	pthread_exit()
In-Reply-To: <1408120684-18295-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 Aug 2014 18:38:02 +0200")
References: <1408120684-18295-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408120684-18295-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sikvy44v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Following the introduction of the support for the musl C library, the
 > support of C++ exceptions or features like pthread_exit() got broken
 > even with other libraries such as glibc. This was reported as bug


Git commit just ate your '#7028' here as it thought it was a
comment. I've fixed it while committing.

-- 
Bye, Peter Korsgaard
