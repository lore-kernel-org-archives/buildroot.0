From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2020 09:27:27 +0200
Subject: [Buildroot] Setting better names for partitions
In-Reply-To: <20200415073840.7f790c52@windsurf.home>
References: <CAOMZO5Cr9PUnSNDtMk7rcA_mC3FTe1AkCJT=9Jpj4WUKSMeDJw@mail.gmail.com>
 <20200415073840.7f790c52@windsurf.home>
Message-ID: <ba08e518-3d50-0840-0a31-bd6e32cd8a17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2020 07:38, Thomas Petazzoni wrote:
[snip]
> However, the ext4 filesystem image
> is created by Buildroot, so you will have to use the
> BR2_TARGET_ROOTFS_EXT2_LABEL Buildroot option to set the label.

 It might make sense to change the default of that config to rootfs instead of
empty. The aria and arietta defconfigs already override it to exactly that.

 Regards,
 Arnout
