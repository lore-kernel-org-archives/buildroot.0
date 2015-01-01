From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 23:14:53 +0100
Subject: [Buildroot] [PATCH] linux: change DEvice Tree prompt
In-Reply-To: <1420150099-13977-1-git-send-email-yann.morin.1998@free.fr>
References: <1420150099-13977-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150101231453.66938a36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Minor typo in title, but another comment below.

On Thu,  1 Jan 2015 23:08:19 +0100, Yann E. MORIN wrote:

>  config BR2_LINUX_KERNEL_DTS_SUPPORT
> -	bool "Device tree support"
> +	bool "Build a Device Tree Blob (DTB)"

We can actually build several DTBs. Is this worth caring about in the
phrasing of the option prompt?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
