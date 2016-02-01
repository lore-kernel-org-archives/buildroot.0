From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 19:23:25 +0100
Subject: [Buildroot] [PATCH v2 0/8] Remove uClibc version selection:
	always use uClibc-ng
In-Reply-To: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Jan 2016 22:25:22 +0100")
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wpqob882.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Since April 2015, the uClibc-ng has done very regular releases of the
 > uClibc C library, and is the de-facto active replacement of the now
 > defunct uClibc project.

 > uClibc 0.9.33 is going to be 4 years old in the coming months, and we
 > already need 50+ patches to make it somewhat usable.

 > It is therefore time to simply offer uClibc-ng as our only supported
 > uClibc version, and remove the options of using uClibc 0.9.33 and
 > uClibc-snapshot. To achieve this, this patch series:

Committed entire series, thanks!

-- 
Bye, Peter Korsgaard
