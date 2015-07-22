From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 16:45:58 +0200
Subject: [Buildroot] [PATCH] netperf: bump to version 2.7.0
In-Reply-To: <1437573590-11966-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437573590-11966-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150722164558.202319a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 10:59:50 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> And work around gcc 5+ defaulting to gnu99, fixes:

gnu99

> +	CFLAGS="$(TARGET_CFLAGS) -std=gnu89"

or gnu89 ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
