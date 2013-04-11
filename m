From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Apr 2013 15:57:46 +0200
Subject: [Buildroot] [PATCH 1/2] fs/jffs2: refactor endianess selection
	to use BR2_ENDIAN
In-Reply-To: <1365362725-30251-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Apr 2013 21:25:24 +0200")
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365362725-30251-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761ztw4o5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of explicitly listing the sub-architectures or architectures
 Thomas> that are big-endian, use BR2_ENDIAN directly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
