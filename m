From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:15:56 +0100
Subject: [Buildroot] [PATCH] lcms2: add upstream security fix for
	CVE-2016-10165
In-Reply-To: <20170130130512.13275-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Jan 2017 14:05:12 +0100")
References: <20170130130512.13275-1-peter@korsgaard.com>
Message-ID: <878tps718j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > An out-of-bounds read in cmstypes.c in Type_MLU_Read function was found,
 > leading to heap memory leak triggered by crafted ICC profile.

 > https://bugzilla.redhat.com/show_bug.cgi?id=1367357

 > Add upstream patch to fix it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
