From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 22:03:56 +0100
Subject: [Buildroot] [PATCH] package/mke2img: set sparse_super for
	revision 1
In-Reply-To: <1440760370-61713-1-git-send-email-benoit@wsystem.com>
 (=?utf-8?Q?=22Beno=C3=AEt=09Th=C3=A9baudeau=22's?= message of "Fri, 28 Aug
 2015 13:12:50 +0200")
References: <1440760370-61713-1-git-send-email-benoit@wsystem.com>
Message-ID: <87si2lc6gz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:

> The sparse_super feature is more efficient in terms of speed and
> available space, so set it by default if supported, i.e. for revision 1.

> This gives a huge speed gain for large resize2fs operations, especially
> for expansion.

> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
