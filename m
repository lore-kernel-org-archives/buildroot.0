From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Feb 2017 12:14:58 +0200
Subject: [Buildroot] [PATCH v2] tslib: bump to 1.4
In-Reply-To: <1486460873-30025-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <20170203141416.4b41aff7@free-electrons.com>
 <1486460873-30025-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <20170207101458.c5uhhasch73sihfx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Tue, Feb 07, 2017 at 10:47:53AM +0100, Martin Kepplinger wrote:
> The update to 1.4, besides the version bump, includes
>  * removing the patch fixing missing headers (upstream)
>  * removing the dependency on 3.12 headers

You should update also tslib reverse dependencies.

I suggest to leave the kernel version dependency removal out of this patch, 
and add a separate revert of 7c60211ce382 instead.

>  * a small change in the package description
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
