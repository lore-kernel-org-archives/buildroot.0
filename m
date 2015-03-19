From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 09:40:59 +0200
Subject: [Buildroot] [PATCH v2] package/numactl: upgrade to 2.0.10
In-Reply-To: <1426743123-1293-1-git-send-email-steven@uplinklabs.net>
References: <1426743123-1293-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319074059.GW2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Mar 18, 2015 at 10:32:03PM -0700, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

Commit log note on package infrastructure change still missing.

> -$(eval $(generic-package))
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
