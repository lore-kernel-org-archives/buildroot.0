From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Jun 2017 09:41:21 +0200
Subject: [Buildroot] [git commit] configs/qemu_sh4*: rename back the
	linux config file to linux-4.9.config
In-Reply-To: <20170619073237.2240481D81@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 19 Jun 2017 09:26:12 +0200")
References: <20170619073237.2240481D81@busybox.osuosl.org>
Message-ID: <87y3sofmqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0f575dd1e3be98ae66a35d527b922b3dc7f1a099
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In commit 28d97609b25cb534a55b6cf6b1945428e817c54a ("configs/qemu:
 > bump to the latest kernel version") updated most qemu defconfigs to
 > use Linux 4.11. However, for the SH4 configurations, Linux 4.9 was
 > kept, because 4.11 apparently has an issue.

 > Unfortunately, while the defconfigs for SH4 were unchanged, the Linux
 > kernel configuration file was renamed from linux-4.9.config to
 > linux-4.11.config.

 > This commit renames the Linux configuration files back to their
 > previous name, linux-4.9.config, matching what the Qemu SH4 defconfigs
 > specify.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks. Longer term I think it is nicer to drop the version number from
the config file name.

-- 
Bye, Peter Korsgaard
