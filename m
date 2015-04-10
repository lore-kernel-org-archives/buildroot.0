From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 21:53:03 +0200
Subject: [Buildroot] [PATCH] qt5: fix license information for
 qt5multimedia and qt5xmlpatterns
In-Reply-To: <1428657204-25558-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428657204-25558-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150410215303.499ae405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Apr 2015 11:13:24 +0200, Thomas Petazzoni wrote:
> While most of the Qt5 components indeed seem to be under LGPLv2.1 with
> exception, or LGPLv3 or GPLv2, the qt5multimedia and qt5xmlpatterns
> components only carry the LGPLv2.1 and LGPLv3 license files, and not
> the GPLv2 license file. So one can safely assume that the GPLv2 option
> is not available for those components, and this commit adjusts the
> <pkg>_LICENSE and <pkg>_LICENSE_FILES variables accordingly.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/c62/c62eef5e5b8add138cdab34e64103d974d0a510b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
