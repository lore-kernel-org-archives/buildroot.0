From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jan 2021 16:03:08 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: CodeSourcery AArch64 2014.11
 does not contain libatomic
In-Reply-To: <87pn2ampup.fsf@dell.be.48ers.dk>
References: <20210109123337.1512700-1-bernd.kuhls@t-online.de>
 <87pn2ampup.fsf@dell.be.48ers.dk>
Message-ID: <87o8huxnfn.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Jan 12 2021, Peter Korsgaard wrote:
>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>
>  > Fixes build error
>  > output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-amd-linux-gnu/4.9.1/../../../../aarch64-amd-linux-gnu/bin/ld:
>  >  cannot find -latomic
>
>  > using this defconfig
>
>  > BR2_aarch64=y
>  > BR2_TOOLCHAIN_EXTERNAL=y
>  > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64=y
>  > BR2_PACKAGE_OPENSSL=y
>
>  > libopenssl is only used here as an example: all packages adding -latomic
>  > if BR2_TOOLCHAIN_HAS_LIBATOMIC=y are broken, like dav1d, ffmpeg, gnutls,
>  > kodi and vlc.
>
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> Committed to 2020.02.x and 2020.11.x, thanks.

Not in 2020.11.x as of commit b460962f5900 ("package/nodejs: security
bump to version 12.20.1").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
