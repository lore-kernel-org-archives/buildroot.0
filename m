From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 14:20:56 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: fix
 build failure with Linux 5.9 and 5.10
In-Reply-To: <20210106212919.540837-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 6 Jan 2021 22:29:19 +0100")
References: <20210106212919.540837-1-giulio.benetti@benettiengineering.com>
Message-ID: <87bldldpvr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add 2 patches pending[1] upstream to fix build failure with both Linux 5.9
 > and Linux 5.10 due to uaccess.h file moved after version >= 5.9 and and
 > due to moved code from dma-contiguous.h to dma-mapping.

 > [1]: https://github.com/mripard/sunxi-mali/pull/89

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
