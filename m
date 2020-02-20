From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 23:44:08 +0100
Subject: [Buildroot] [PATCH] package/tpm2-tss: wip: bump to version 2.3.3
In-Reply-To: <20200220214530.20200-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 20 Feb 2020 22:45:30 +0100")
References: <20200220214530.20200-1-peter@korsgaard.com>
Message-ID: <87wo8g281z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfix release, fixing a number of issues:
 > - Fixed mixing salted and unsalted sessions in the same ESAPI context
 > - Removed use of VLAs from TPML marshal code
 > - Added check for object node before calling compute_session_value function
 > - Fixed auth calculation in Esys_StartAuthSession called with optional parameters
 > - Fixed compute_encrypted_salt error handling in Esys_StartAuthSession
 > - Fixed exported symbols map for libtss2-mu

Ups, the 'wip' in the subject should be dropped now that I got feedback
from upstream.

-- 
Bye, Peter Korsgaard
