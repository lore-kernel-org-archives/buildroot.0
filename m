From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:54:51 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain-external: add CodeSourcery
 PowerPC 2012.03
In-Reply-To: <20140608164931.GM3266@free.fr>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140608164931.GM3266@free.fr>
Message-ID: <20140608185451.168ead73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 8 Jun 2014 18:49:31 +0200, Yann E. MORIN wrote:
> > +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203),y)
> > +TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
> > +TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
> 
> wget "${TOOLCHAIN_EXTERNAL_SITE}${TOOLCHAIN_EXTERNAL_SOURCE}"
>  --> 404

TOOLCHAIN_EXTERNAL_SITE should have been
http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu/.
I didn't detect the problem because I had already the toolchain
downloaded in my $(DL_DIR). I'll fix that!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
