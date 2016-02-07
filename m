From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 22:58:40 +0100
Subject: [Buildroot] [PATCH] package/libatomic_ops: rename libatomic_ops
 supported arch Kconfig symbol
In-Reply-To: <20160207225208.76f8e18c@free-electrons.com>
References: <1454881551-9526-1-git-send-email-romain.naour@gmail.com>
 <20160207225208.76f8e18c@free-electrons.com>
Message-ID: <56B7BE10.8090509@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 07/02/2016 22:52, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun,  7 Feb 2016 22:45:51 +0100, Romain Naour wrote:
> 
>> +config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>> +	bool "libatomic_ops arch support option has been renamed"
>> +	select BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
> 
> This symbol is an hidden symbol, there is no need for legacy handling.

Indeed, I'll fix in v2.

Best regards,
Romain

> 
> Thomas
> 
