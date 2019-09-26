From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 26 Sep 2019 09:24:04 +0200
Subject: [Buildroot] [PATCH] package/python-entrypoints: new package
In-Reply-To: <20190925232300.437a503d@windsurf>
References: <20190525220058.2796-1-sergei.sakhno@gmail.com>
 <20190925232300.437a503d@windsurf>
Message-ID: <CAGm1_kur7tnN-qNnRq_CiKQhkV3MLCVVhz=TVdZTavF3-w8p9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Serhii,

On Wed, Sep 25, 2019 at 11:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I'm adding Yegor Yefremov in Cc.
>
> On Sun, 26 May 2019 01:00:58 +0300
> Serhii Sakhno <sergei.sakhno@gmail.com> wrote:
>
> > Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>
>
> How does this compare to python-fastentrypoints that we already have ?
> Do we need both ?
>
> Also, for python-fastentrypoints we only have a host variant of the
> package, as it's only meant to be executed during the build. Why does
> python-entrypoints needs both a target and host package ?
>
> A more verbose commit log would have helped a bit to understand the use
> case for this package.
>
> Also, an entry in the DEVELOPERS file should be added.
>
> Asaf, Yegor, if you have any comments/suggestion/opinion, I'm
> interested :-)

Looks like entrypoints packages just finds the entry_points (though I
still grok what it is useful for). python-fastentrypoints speeds up
the script start process.

@Serhii are there any Python packages at PyPI that are using this
package? I'd like to see them in order to undestand how this package
should be used and whether we need the host-, target- or both
vairants.

Cheers,
Yegor
