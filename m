From: =?windows-1252?Q?Vincent_Stehl=E9?= <vincent.stehle@laposte.net>
Date: Wed, 29 Apr 2015 07:49:53 +0200
Subject: [Buildroot] [PATCH 3/7] boot/uboot: do not check hash for
	custom versions
In-Reply-To: <12d715d71a908668d9156cfb3c0a0de1966bea66.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <12d715d71a908668d9156cfb3c0a0de1966bea66.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <55407101.1080102@bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2015 12:40 AM, Yann E. MORIN wrote:
> For custom tarballs, it's quite obvious we can not check hashes.

Hi Yann,

Thank you for this patch. It does repair for me the build of
pandaboard_defconfig.

Best regards,

V.
