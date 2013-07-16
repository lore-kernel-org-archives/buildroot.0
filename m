From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:15:26 +0200
Subject: [Buildroot] [PATCHv3 06/14] toolchain: remove the old
	BR2_VFP_FLOAT option
In-Reply-To: <1373961805-3901-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:17 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehay1w9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Now that we have a much better way of selecting between the various
 Thomas> VFP versions and capabilities, the BR2_VFP_FLOAT version no longer
 Thomas> makes sense. This commit gets rid of it, and adds the appropriate
 Thomas> Config.in.legacy code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
