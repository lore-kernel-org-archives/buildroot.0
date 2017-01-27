From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 13:46:48 +0100
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.9.6 in
	synopsys defconfigs
In-Reply-To: <1485519972-15580-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Fri, 27 Jan 2017 15:26:12 +0300")
References: <1485519972-15580-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87sho4brgn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > With this commit we update ARC defconfigs with the following:
 >   - "snps_axs101_defconfig" and "snps_axs103_defconfig":
 >      - bump linux kernel version to 4.9.6
 >      - set up host linux headers to 4.9

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
 > ---
 >  configs/snps_axs101_defconfig | 6 +++---
 >  configs/snps_axs103_defconfig | 6 +++---
 >  2 files changed, 6 insertions(+), 6 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
