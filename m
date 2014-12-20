From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 20 Dec 2014 15:27:34 +0100
Subject: [Buildroot] [PATCH v5 00/15] Add Xorg support for iMX6
In-Reply-To: <5494D3C6.6060006@gmail.com>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <5494D3C6.6060006@gmail.com>
Message-ID: <2664122.16Rl9eEuFN@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Garry,

On Friday 19 December 2014 17:41:26 Gary Bisson wrote:
> Jerome, All,
> 
> On 12/09/2014 05:46 AM, J?r?me Pouiller wrote:
> > Hello,
> >
> > Main purpose of this serie is to add support of Vivante GPU (found on 
imx6) to
> > Xorg. This work is mainly adapted from Yocto.
> >
> > v5:
> >    - Add references in commit log of xdriver_xf86-video-imx-viv
> >    - Split qmx6_defconfig in two defconfig: a minimal one and a demo one
[...] 
> I haven't tested this series of patch as Thomas had some remarks. Let me 
> know if I should test it anyway or if I should wait for a v6.
Thomas remarks are only related to Qt5 modifications. I have not yet totally 
answered these remarks, but apart from Qt5 patch, there is no opened issues on 
this series. 

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
