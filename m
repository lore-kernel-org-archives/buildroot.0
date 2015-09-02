From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 13:10:34 +0300
Subject: [Buildroot] [PATCHv2 1/2] udisks: bump to version 1.0.5
In-Reply-To: <1441188349-13079-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441188349-13079-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150902101033.GY17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Sep 02, 2015 at 11:05:48AM +0100, Vicente Olivert Riera wrote:
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +UDISKS_CONF_OPTS += libgudev
> +endif

So libgudev is not even an optional dependency when there is no systemd?

In any case, a comment explaining this unusual dependency would be nice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
