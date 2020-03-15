From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 15 Mar 2020 17:23:20 +0100
Subject: [Buildroot] [PATCH] package/python-markdown: fix Python version
 dependency
In-Reply-To: <20200315163316.00284574@windsurf>
References: <20200310114101.6726-1-yegorslists@googlemail.com>
 <20200315163316.00284574@windsurf>
Message-ID: <CAGm1_kuXiUBbwvfYR38VcCTDg+B0NN7CXU-++89-Z4yUMMOR3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 15, 2020 at 4:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 10 Mar 2020 12:41:01 +0100
> yegorslists at googlemail.com wrote:
>
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The latest version has dropped Python 2 support.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> So, should this patch be marked as Rejected ?

Basically, the patch is eligible as is. But it depends on the above
mentioned patch series that also touches python-cheetah. As soon as it
is reworked and merged, python-markdown is only an optional dependency
of the python-cheetah package and can be applied.

Yegor
