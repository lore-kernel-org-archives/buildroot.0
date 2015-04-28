From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Apr 2015 12:01:14 +0300
Subject: [Buildroot] [PATCH v3] cc-tool: new package
In-Reply-To: <1430207072-12150-1-git-send-email-marcin@bis.org.pl>
References: <20150428032827.GX2258@tarshish>
 <1430207072-12150-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20150428090114.GY2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Tue, Apr 28, 2015 at 09:44:32AM +0200, Marcin Bis wrote:
> cc-tool provides support for Texas Instruments CC Debugger
> 
> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
> ---

[snip]

> +comment "cc-tool needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

The comment text doesn't match the list of dependencies. Please remove 
"largefile".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
