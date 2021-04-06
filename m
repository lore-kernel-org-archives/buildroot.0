From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 09:37:44 +0200
Subject: [Buildroot] [PATCH] boot/grub2: ignore the last 3 remaining CVEs
In-Reply-To: <20210405185231.1363881-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 5 Apr 2021 20:52:30 +0200")
References: <20210405185231.1363881-1-thomas.petazzoni@bootlin.com>
Message-ID: <87zgybooc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > An analysis of the last 3 remaining CVEs that are reported to affect
 > the grub2 package has allowed to ensure that we can safely ignore
 > them:

 >  * CVE-2020-14372 is already fixed by a patch we have in our patch
 >    stack for grub2

 >  * CVE-2019-14865 and CVE-2020-15705 are both distro-specific and do
 >    not affect grub2 upstream, nor grub2 with the stack of patches we
 >    have in Buildroot

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks. Thanks for looking into it.

-- 
Bye, Peter Korsgaard
