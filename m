From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 12:30:59 +0200
Subject: [Buildroot] [RFCv1 4/8] gcc: musl patches only available for
	gcc 4.7+
In-Reply-To: <1398291272-17591-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 24 Apr 2014 00:14:28 +0200")
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1398291272-17591-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbtlkf8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > For the moment, the musl support is not in mainline gcc, so it
 > requires a few patches. We have integrated those patches only for gcc
 > 4.7 and gcc 4.8 at the moment, so only allow those gcc versions when
 > the musl library is selected.

It would be good to support 4.9 as well.

-- 
Bye, Peter Korsgaard
