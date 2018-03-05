From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 20:45:33 +0100
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <CAHkwnC_CBRZGZmV9J7PbWYdyquMHh4OdYVdsMdxWq-_+4F2QGg@mail.gmail.com>
References: <20180304224808.566fa00d@windsurf.home>
 <CAHkwnC_CBRZGZmV9J7PbWYdyquMHh4OdYVdsMdxWq-_+4F2QGg@mail.gmail.com>
Message-ID: <20180305204533.55bf5e7b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Mar 2018 18:09:36 +0100, Fabio Porcedda wrote:

> >  - telit_evk_pro3_defconfig
> >
> >    https://gitlab.com/buildroot.org/buildroot/-/jobs/55306952
> >
> >    Fabio (Porcedda): could you add yourself as the maintainer for this
> >    board in the DEVELOPERS file ? Thanks!
> >  
> 
> Unfortunately a newer kernel doesn't boot and I don't have the time to
> fix the issue.
> If having a defconfig that doesn't build on gcc 6.x is unacceptable
> feel free to remove it.

Well, we could revert to gcc 5.x, but that is only a temporary measure.
And if newer kernels don't work, it probably means that the platform is
not very popular/widely used, so perhaps having a defconfig for it
isn't that useful ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
