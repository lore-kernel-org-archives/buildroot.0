From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:58:34 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux: add option to
 explicitlyspecify the kernel image name : breaks kernel build !
In-Reply-To: <D5A9AA060AA94EDA827C2219FEFFDD4D@JohanW7>
References: <20140711124922.GA25220@waldemar-brodkorb.de>
 <8464FBE548EF40ECA03DD045E23F1D39@JohanW7>
 <D5A9AA060AA94EDA827C2219FEFFDD4D@JohanW7>
Message-ID: <20140717225834.30434820@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 17 Jul 2014 17:29:23 +0200, Sagaert Johan wrote:

> If BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
> then LINUX_TARGET_NAME is undefined.
> 
> LINUX_TARGET_NAME is used on lines 266 (linux/linux.mk) and 341 to build the kernel.

Thanks for reporting this problem! It has been fixed in commit
http://git.buildroot.net/buildroot/commit/?id=f8f3073b18895bbf6938a5c310f6e6134f8bd6cb.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
