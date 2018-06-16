From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:05 +0200
Subject: [Buildroot] [PATCH v3 1/6] package/speexdsp: new package
In-Reply-To: <20180613162826.3490-1-bernd.kuhls@t-online.de>
References: <20180613162826.3490-1-bernd.kuhls@t-online.de>
Message-ID: <20180616142905.0a63457e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 18:28:21 +0200, Bernd Kuhls wrote:
> Quoting speex release notes from https://www.speex.org
> 
> "Speex 1.2rc2 and SpeexDSP 1.2rc2 are out
>  December 6, 2014
>  This release splits the speex codec library and the speex DSP library
>  into separate source trees."
> 
> After bumping speex to 1.2.0 this new package is necessary to provide
> speex-based DSP support for packages like Freeswitch and Asterisk.
> 
> We use current git HEAD which received 21 commits since the 1.2rc3
> tarball was released in 2015, including a fix for building on arm.
> 
> We still need another patch which was not committed to git master to
> fix building on aarch64.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: updated package description and patch description (Peter)
> v2: no changes

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
