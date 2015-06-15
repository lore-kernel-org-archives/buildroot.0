From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2015 16:18:03 +0200
Subject: [Buildroot] [PATCH v2 1/3] boot/at91bootstrap3: add license
 information
In-Reply-To: <1433234780-21084-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
 <1433234780-21084-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150615161803.21843524@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue,  2 Jun 2015 10:46:18 +0200, Angelo Compagnucci wrote:

>  AT91BOOTSTRAP3_VERSION = v3.7.1
>  AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
> +AT91BOOTSTRAP3_LICENSE = BSD-2c with endorsement clause
> +AT91BOOTSTRAP3_LICENSE_FILES = main.c

The license is neither a BSD-2c nor a BSD-3c, so I changed that to
"Atmel License", like Yocto is doing, after a suggestion from Alexandre
Belloni. Applied after doing this change.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
