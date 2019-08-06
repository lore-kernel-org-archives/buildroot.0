From: Nylon Chen <nylon7@andestech.com>
Date: Wed, 7 Aug 2019 07:40:46 +0800
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: add patch for nds32
 support
In-Reply-To: <20190803162234.52531fab@windsurf.home>
References: <20190426080703.2604-1-nylon7@andestech.com>
 <20190803162234.52531fab@windsurf.home>
Message-ID: <20190806234045.GA27616@atcfdc88>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Helo Thomas,

On Sat, Aug 03, 2019 at 10:22:34PM +0800, Thomas Petazzoni wrote:
> Hello Nylon,
> 
> On Fri, 26 Apr 2019 16:07:03 +0800
> Nylon Chen <nylon7@andestech.com> wrote:
> 
> > Fixes:
> >   http://autobuild.buildroot.net/results/a2fc44575a900f2221c2a3a11491c527871555ee/
> > 
> > Signed-off-by: Nylon Chen <nylon7@andestech.com>
> > ---
> >  ...0003-Improve-support-for-Linux-nds32.patch | 76 +++++++++++++++++++
> >  ...direction-NDS32-stack-grows-downward.patch | 25 ++++++
> >  2 files changed, 101 insertions(+)
> >  create mode 100644 package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
> >  create mode 100644 package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch
> 
> Applied to master, thanks. However, please submit these changes to the
> upstream libsigsegv project, we don't want to keep them forever as
> patches in Buildroot.
I will be submit to the upstream libsigsegv project.
> 
> Thanks!
Thank you for your commit.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
