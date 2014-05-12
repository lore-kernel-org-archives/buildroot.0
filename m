From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 20:24:16 +0200
Subject: [Buildroot] [PATCH v6 00/32] xbmc: bump version to 13.0-Gotham
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
 <20140512195612.0e26443a@free-electrons.com>
Message-ID: <g7g74bx73e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140512195612.0e26443a at free-electrons.com:

> It would be nice if you could split it in two patch series, one with
> the fixes only (to be applied during the -rc cycle) and one with the
> major changes changes

Hi,

looking at my patch series I consider none of them relevant for inclusion 
before 2014.05 is released.

Most of the mesa3d patches are only relevant for the mesa3d 10.2 version bump 
(like the libxml2/python patch).

The xdriver_xf86-video-intel version bump patch can be committed as is, 
however, but it is not really necessary, according to autobuilder logs ;)

The rtmpdump KSV patch does not fix a broken package but extends it with 
community patches.

All other xbmc patches are extentions/fixes which are only relevant for xbmc 
Gotham.

So I would like to suggest to commit my series right after the release of 
2014.05 so it can be extensively tested by autobuilders. I am still finding 
problems here, like the need for ipv6 support last weekend, so we should use 
as much time of the next release cycle as possible.

Regards, Bernd
