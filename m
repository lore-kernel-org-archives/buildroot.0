From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:07:36 +0200
Subject: [Buildroot] [PATCH] libminiupnpc: add upstream security fix for
	CVE-2017-8798
In-Reply-To: <20170519134802.9606-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 19 May 2017 15:48:02 +0200")
References: <20170519134802.9606-1-peter@korsgaard.com>
Message-ID: <87o9u7ls2f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2017-8798: Integer signedness error in MiniUPnP MiniUPnPc v1.4.20101221
 > through v2.0 allows remote attackers to cause a denial of service or
 > possibly have unspecified other impact.

 > For more details including a PoC, see:
 > https://github.com/tintinweb/pub/tree/master/pocs/cve-2017-8798

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
