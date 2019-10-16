From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Oct 2019 17:50:35 -0300
Subject: [Buildroot] [PATCH v2 2/4] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <20191011152018.46a51ec2@windsurf>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-2-festevam@gmail.com>
 <20191010223853.680453ee@windsurf>
 <CAOMZO5C8BmpNOn632xrYWTHmD5LeOeoCAsXVfN5Jr1wWtsJmuA@mail.gmail.com>
 <CAK4VdL34zHGntieYHunSrOwMCcH05R_YwhGJd9jd8t_tpPYUvg@mail.gmail.com>
 <20191011152018.46a51ec2@windsurf>
Message-ID: <CAOMZO5A_S3k5UmkE9UgG0zeiOm01tMMt-iU6paSs=O6Lv95BOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 11, 2019 at 10:20 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 11 Oct 2019 15:15:16 +0200
> Erico Nunes <nunes.erico@gmail.com> wrote:
>
> > I think it is a valid choice to not have it. For example, you might be
> > interested in only having the GPU for offscreen rendering. So if you
> > do want the drm driver to bridge to the display, I think you should
> > just enable kmsro.
>
> Ah, OK, indeed that makes sense. I'll revive Fabio's patch then.

Do you want me to resend this patch?
