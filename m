From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 4 Sep 2015 10:58:57 +0300
Subject: [Buildroot] [PATCH] make help: remove <pkg>-legal-info
In-Reply-To: <1441351061-6306-1-git-send-email-luca@lucaceresoli.net>
References: <1441351061-6306-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150904075857.GN18583@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Fri, Sep 04, 2015 at 09:17:41AM +0200, Luca Ceresoli wrote:
> The <pkg>-legal-info target is only a component of the top-level
> legal-info target, it is not meant to be used alone.
> 
> For example, calling twice 'make busybox-legal-info' produces duplicate
> entries in licenses.txt and manifest.csv.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
