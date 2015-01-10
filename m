From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:39:48 +0100
Subject: [Buildroot] [PATCH v2 2/8] boot/uboot: Replace
 TARGET_CONFIGURE_OPTS with TARGET_MAKE_ENV
In-Reply-To: <1420897647-25001-3-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
 <1420897647-25001-3-git-send-email-jkrause@posteo.de>
Message-ID: <20150110163948.336837a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 10 Jan 2015 14:47:21 +0100, J?rg Krause wrote:
> Use TARGET_MAKE_ENV instead of TARGET_CONFIGURE_OPTS for building the U-Boot
> target with 'make <board>_(def)config' and 'make'.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Why? TARGET_CONFIGURE_OPTS is clearly not  the same as TARGET_MAKE_ENV.
While I agree that TARGET_MAKE_ENV should be passed, the commit log
should contain an explanation as to why TARGET_CONFIGURE_OPTS is not
necessary.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
