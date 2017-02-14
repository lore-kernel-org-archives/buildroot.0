From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Tue, 14 Feb 2017 11:51:15 +0530
Subject: [Buildroot] [git commit] wget: bump to 1.19.1 to fix build issue
In-Reply-To: <20170213211546.74209821DB@busybox.osuosl.org>
References: <20170213211546.74209821DB@busybox.osuosl.org>
Message-ID: <56d19988-be8e-e7a7-a6a6-3fe613f5d73c@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tuesday 14 February 2017 02:43 AM, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=c36f0d65ad63589f1b21833ef53d429c018b6f8a
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Due to the patches we have on wget 1.19, we need to
> autoreconf. Unfortunately, when the autoreconfiguration process occurs
> with host-gettext already built and installed, the build of wget fails
> with a fairly weird error:
>
> In file included from str-two-way.h:44:0,
>                  from c-strcasestr.c:37:
> ./stdint.h:89:5: error: #if with no expression
>  #if


I was unable to reproduce these build failures at my end and also 
suspecting that it is side effect of autoreconf. Thanks for version bump.

Regards,
Rahul
