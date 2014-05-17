From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 11:35:40 +0200
Subject: [Buildroot] [PATCH] elfutils: propagate architecture dependency
	to comment
In-Reply-To: <1400316771-25226-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 10:52:51 +0200")
References: <1400316771-25226-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqdkoihf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > elfutils depends on !BR2_avr32, but this dependency was not properly
 > propagated to the comment about toolchain options. This commit fixes
 > that.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
