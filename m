From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 09:07:32 +0200
Subject: [Buildroot] [PATCH v4 1/1] mosh: new package
In-Reply-To: <1437688804-26537-1-git-send-email-christian@paral.in>
References: <1437688804-26537-1-git-send-email-christian@paral.in>
Message-ID: <20150724090732.6c27c55a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Thu, 23 Jul 2015 15:00:04 -0700, Christian Stewart wrote:

> +comment "mosh needs a host architecture of x64 or x86"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

Why ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
