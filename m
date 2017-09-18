From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 18 Sep 2017 16:19:23 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH_1/1=5D_Added_support_for_LeMa?=
	=?iso-8859-1?q?ker_BananaPi_M2_Plus_board=2E?=
In-Reply-To: <1505743107-53140-1-git-send-email-mike.harmony@snapav.com>
References: <1505743107-53140-1-git-send-email-mike.harmony@snapav.com>
Message-ID: <0a437ed4-d6e9-4af4-a639-d115b90fa9f5@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://git.kernel.org/torvalds/t/linux-4.13-rc5.tar.gz"

Hi Mike, I think that this is a bit unusual. Is there a specific minimal 
release that this board needs? If so, can you document that in the 
changelog? In addition, the 4.13 kernel has been already released, so I 
don't think it's a good approach to target an obsolete RC.

With kind regards,
Jan
