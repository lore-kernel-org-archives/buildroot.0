From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:09:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix static build with
 curl and libidn2
In-Reply-To: <20190308215200.11949-1-fontaine.fabrice@gmail.com>
References: <20190308215200.11949-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309150920.343482ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Mar 2019 22:52:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/be5893b507d22a23951efeea20c18642742cef5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

As upstream replied in the pull request, the CMake FindCURL module
already uses pkg-config if available. Could you investigate what this
doesn't work as expected ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
