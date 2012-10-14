From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Oct 2012 20:15:16 +0200
Subject: [Buildroot] [PATCH] mesa3d: add dependency on
	host-xutil_makedepend
In-Reply-To: <1350061104-5523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 12 Oct 2012 18:58:24 +0200")
References: <1350061104-5523-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwzozzrf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The mesa3d now requires the makedepend host utility, otherwise, it
 Thomas> fails with:

 Thomas> configure: error: makedepend is required to build Mesa

Committed, thanks.

-- 
Bye, Peter Korsgaard
