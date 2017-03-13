From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Mar 2017 14:21:32 +0200
Subject: [Buildroot] [PATCH] nano: bump version to 2.7.5
In-Reply-To: <20170313115030.16340-1-Vincent.Riera@imgtec.com>
References: <20170313115030.16340-1-Vincent.Riera@imgtec.com>
Message-ID: <20170313122132.7vx3gfmhqmpvtkgf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Mon, Mar 13, 2017 at 11:50:30AM +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

[snip]

>  NANO_VERSION_MAJOR = 2.7
> -NANO_VERSION = $(NANO_VERSION_MAJOR).4
> +NANO_VERSION = $(NANO_VERSION_MAJOR).5

A similar bump has recently been reverted (commit 850722fc68a16) because of 
musl build issues.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
