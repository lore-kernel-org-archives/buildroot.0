From: Pieter Smith <pieter@boesman.nl>
Date: Tue, 19 Apr 2016 22:17:33 +0200
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <20160419212441.6a0454e9@free-electrons.com>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <20160419212441.6a0454e9@free-electrons.com>
Message-ID: <20160419201733.GA19934@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Apr 19, 2016 at 09:24:41PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 20 Mar 2016 23:35:44 +0100, Pieter Smith wrote:
> 
> > Pieter Smith (7):
> >   barebox: support multi-image-build image selection
> >   barebox: friendly error on missing built image
> >   barebox: support custom barebox output image name
> >   barebox: introduce barebox-package function
> >   barebox: extract package name argument
> >   barebox: support 2nd config build
> >   beaglebone: adds barebox bootloader defconfig
> 
> Since there were some comments on this v4, I marked it as Changes
> Requested in our patch tracking system. When you find some time, can
> you send an updated v5 of this patch series?

I have been a little short on time as of late. The patch is complete, but I
am having probably unrelated problems with my BBB set-up that I am trying to
troubleshoot. Nevertheless, I would like to make sure that everything works
before reposting. Maybe Yegor can help to test that everything works?

@Yegor: Do you have time to test the branch on your setup?
  URL:    https://github.com/smipi1/bbb_buildroot.git
  branch: barebox_2nd_config_build-v5

- Pieter

[snip]
