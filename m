From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 14:10:11 +0200
Subject: [Buildroot] [PATCH 2/3] package/ima-evm-utils: fix build for
 old compilers
In-Reply-To: <20200722193532.32150-2-petr.vorel@gmail.com>
References: <20200722193532.32150-1-petr.vorel@gmail.com>
 <20200722193532.32150-2-petr.vorel@gmail.com>
Message-ID: <20200723141011.0dc8c6a3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 21:35:31 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Fixes:
>                      sourcery-arm-armv4t [38/44]: FAILED
>                             sourcery-arm [39/44]: FAILED
>                      sourcery-arm-thumb2 [40/44]: FAILED
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Is this needed only due to the 1.3 version bump ? Were these old
compilers building ima-evm-utils properly in the current version we
have in Buildroot ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
