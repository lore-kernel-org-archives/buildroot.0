From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 16:01:44 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: fix build with some old
 toolchains
In-Reply-To: <CAPi7W82Mof=7vNE8quasJNiRd8Yt8YTaRsdTXfZWOnQT0tFURg@mail.gmail.com>
References: <20180812074520.1467-1-fontaine.fabrice@gmail.com>
 <20180812143203.049f7619@windsurf>
 <CAPi7W82Mof=7vNE8quasJNiRd8Yt8YTaRsdTXfZWOnQT0tFURg@mail.gmail.com>
Message-ID: <20180812160144.0d172d2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 15:52:07 +0200, Fabrice Fontaine wrote:

> > To be honest, I don't have enough C++ knowledge to figure out if this
> > is the right fix, but I've applied to master anyway. Please submit
> > upstream to get a proper review. Thanks!
> >  
> I sent it upstream (https://github.com/MusicPlayerDaemon/ncmpc/pull/29) but
> the PR has been closed :-/

Considering upstream's reaction, perhaps we should drop the patch, and
add the appropriate BR2_TOOLCHAIN_HAS_GCC_AT_LEAST_... dependency ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
