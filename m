From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Oct 2019 15:20:18 +0200
Subject: [Buildroot] [PATCH v2 2/4] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <CAK4VdL34zHGntieYHunSrOwMCcH05R_YwhGJd9jd8t_tpPYUvg@mail.gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-2-festevam@gmail.com>
 <20191010223853.680453ee@windsurf>
 <CAOMZO5C8BmpNOn632xrYWTHmD5LeOeoCAsXVfN5Jr1wWtsJmuA@mail.gmail.com>
 <CAK4VdL34zHGntieYHunSrOwMCcH05R_YwhGJd9jd8t_tpPYUvg@mail.gmail.com>
Message-ID: <20191011152018.46a51ec2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 15:15:16 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> I think it is a valid choice to not have it. For example, you might be
> interested in only having the GPU for offscreen rendering. So if you
> do want the drm driver to bridge to the display, I think you should
> just enable kmsro.

Ah, OK, indeed that makes sense. I'll revive Fabio's patch then.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
