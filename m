From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 21:59:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcoap: new package
In-Reply-To: <1464617734-24139-1-git-send-email-joris.lijssens@gmail.com>
References: <1464617734-24139-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160609215930.32aa26c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 May 2016 16:15:34 +0200, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix typo in libcoap.mk

I've applied the patch, after doing quite a few changes:

    [Thomas:
     - Adjust license: it is "GPLv2+ or BSD-2c" and not "GPLv2, BSD-2c"
     - Add the COPYING file to the license files, since it indicates
       explictly that the license is GPLv2+ or BSD-2c.
     - Remove the --with-shared configure options, which doesn't exist.
     - Use LIBCOAP_AUTORECONF = YES instead of calling the autogen.sh script
       manually.
     - Add patch to fix build with old gcc versions.]

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
