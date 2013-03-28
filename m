From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Mar 2013 15:33:16 +0200
Subject: [Buildroot] [PATCHv2] linknx: new package
In-Reply-To: <1364476686-12850-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364476686-12850-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130328133316.GA4180@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 28, 2013 at 02:18:05PM +0100, Thomas Petazzoni wrote:
> From: Gregory Hermant <gregory.hermant@calao-systems.com>
> 
> [Thomas: various fixes/improvements]
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v1 -> v2:
>  * Add dependency on C++ support, as noted by Peter.
>  * The support of log4cxx is not added, because linknx requires
>    log4cxx >= 1.0 and we only have 0.10 has a package.
> ---

[...]

> +LINKNX_VERSION = 0.0.1.30
> +LINKNX_SOURCE = linknx-${LINKNX_VERSION}.tar.gz

Curly braces? Besides, isn't this the default already?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
