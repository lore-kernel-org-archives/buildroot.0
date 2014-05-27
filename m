From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 22:35:49 +0200
Subject: [Buildroot] [PATCH v5 9/9] powerpc: add powerpc64 and
	powerpc64le support
In-Reply-To: <5384F0D8.7010002@linux.vnet.ibm.com> (Cody P. Schafer's message
 of "Tue, 27 May 2014 13:08:56 -0700")
References: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399958901-7867-10-git-send-email-cody@linux.vnet.ibm.com>
 <87ha4cfhqi.fsf@dell.be.48ers.dk>
 <5384F0D8.7010002@linux.vnet.ibm.com>
Message-ID: <87oayjc63e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cody" == Cody P Schafer <cody@linux.vnet.ibm.com> writes:

Hi,

 >> It looks like you forgot gcc 4.8.x.

 > Actually, I ended up discovering in testing that gcc 4.8.2 has patches
 > to support powerpc64le, but failed to update the patch description to
 > reflect that :(

Ok, care to send a followup patch enabling 4.8.x support then?

-- 
Bye, Peter Korsgaard
