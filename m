From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 09:34:44 +0200
Subject: [Buildroot] [PATCH] liboping: bump to version 1.9.0
In-Reply-To: <1467459980-12422-1-git-send-email-gustavo@zacarias.com.ar>
References: <1467459980-12422-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160704093444.51753830@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 08:46:20 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/liboping/liboping.hash | 2 +-
>  package/liboping/liboping.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Not sure it's related to this last bump, but it lacks the usual -lrt
for clock_gettime() for old glibc versions:

  http://autobuild.buildroot.net/results/c2d/c2d3ed8b1832492bc8747a60c81d61f64a36c27c/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
