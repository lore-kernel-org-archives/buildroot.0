From: Shyam Saini <mayhs11saini@gmail.com>
Date: Thu, 8 Oct 2020 21:03:41 +0530
Subject: [Buildroot] [V4 PATCH 1/1] cukinia: new package
In-Reply-To: <20201006213715.18669cd8@windsurf.home>
References: <20200505132243.16773-1-shyam.saini@savoirfairelinux.com>
 <20200505132243.16773-2-shyam.saini@savoirfairelinux.com>
 <20201006213715.18669cd8@windsurf.home>
Message-ID: <CAOfkYf4=PMhgJPB7BCw_rTce_e1pLdDVUA6fTU_TFwkDU2magQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello Shyam,
>
> On Tue,  5 May 2020 09:22:43 -0400
> Shyam Saini <mayhs11saini@gmail.com> wrote:
>
> > From: Shyam Saini <mayhs11saini@gmail.com>
> >
> > Cukinia is a test framework designed to help Linux-based embedded
> > systems developers run simple system-level validation tests on their
> > firmware.
> >
> > It is designed to integrate well with embedded Linux systems
> > generation tools, and can be run manually (providing a quick
> > colourized summary to eye-catch regressions), or any of continuous
> > available integration framework, by generating Junit-XML or CSV test
> > reports.
> >
> > Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
> > Signed-off-by: Shyam Saini <shyam.saini@savoirfairelinux.com>
> > Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Thanks, I have applied your patch! The only minor mistake was that you
> didn't use tabs in the INSTALL_TARGET_CMDS, which was reported by "make
> check-package". The commit title should also have had a package/cukinia
> prefix.
>
> I fixed those minor details when applying. Thanks!

Thanks a lot for fixing these minor issues. Will take extra care next time.
