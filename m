From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Dec 2015 22:56:36 +0200
Subject: [Buildroot] [PATCH 9/9] wireshark: add optional sbc support
In-Reply-To: <1449089301-29762-9-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202205636.GR2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Wed, Dec 02, 2015 at 05:48:21PM -0300, Gustavo Zacarias wrote:
> +ifeq ($(BR2_PACKAGE_SBC),y)
> +WIRESHARK_CONF_OPTS += --with-sbc=yes
> +WIRESHARK_DEPENDENCIES += sbc
> +else
> +WIRESHARK_CONF_OPTS += --with-sbc=no
> +endif

Which package is that? I couldn't find BR2_PACKAGE_SBC in current master.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
