From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:01:13 +0200
Subject: [Buildroot] [PATCH] config: update synopsys defconfigs
In-Reply-To: <1470228432-31937-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Wed, 3 Aug 2016 15:47:12 +0300")
References: <1470228432-31937-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87bn19lls6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > With this commit we update ARC defconfigs with the following:
 >   - "snps_axs101_defconfig" and "snps_axs103_defconfig":
 >      - bump linux kernel version to 4.7
 >      - set up host linux headers to 4.7
 >      - bump u-boot version to 2016.07

 >   - "snps_hs38_smp_vdk_defconfig":
 >      - bump linux kernel version to 4.7
 >      - set up host linux headers to 4.7

 > Also we delete "snps_hs38_vdk_defconfig" as we doesn't support
 > uni-processor HS38 configuration for vdk any longer.

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
