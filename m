From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 May 2013 20:43:12 +0300
Subject: [Buildroot] [PATCH 2/2] ptpd2: new package
In-Reply-To: <1367944785-27159-2-git-send-email-gustavo@zacarias.com.ar>
References: <1367944785-27159-1-git-send-email-gustavo@zacarias.com.ar>
 <1367944785-27159-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130507174311.GM5202@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, May 07, 2013 at 01:39:45PM -0300, Gustavo Zacarias wrote:
> Add the ptpd2 package, handles the IEEE 1588-2008 spec which is not
> backward compatible to IEEE 1588-2002.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

[snip]

> +config BR2_PACKAGE_PTPD2
> +	bool "ptpd2"
> +	help
> +	  The PTP daemon (PTPd) implements the Precision Time protocol
> +	  (PTP) as defined by the IEEE-1588-2008.

Please mention here also that this package is not compatible with IEEE 
1588-2002, and that the ptpd should be used instead.

baurch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
