From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 23:36:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] refpolicy: bump to 2.20170805
In-Reply-To: <20171105180944.6773-1-Adamduskett@outlook.com>
References: <20171105180944.6773-1-Adamduskett@outlook.com>
Message-ID: <20171105233630.1ac72388@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Nov 2017 13:09:44 -0500, Adam Duskett wrote:

>  # Cannot use multiple threads to build the reference policy
>  REFPOLICY_MAKE = \
>  	TEST_TOOLCHAIN=$(HOST_DIR) \
> -	PYTHON="$(HOST_DIR)/bin/python2" \
> +	PYHON=$(HOST_DIR)/bin/python \

Pyhon ? Is that a new species of snake ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
