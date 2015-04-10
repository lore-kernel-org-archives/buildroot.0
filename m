From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 21:54:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/gd: Add dependency to libvpx
In-Reply-To: <1428686531-13084-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428686531-13084-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150410215453.27ff863d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 10 Apr 2015 19:22:10 +0200, Bernd Kuhls wrote:
> Needed to get reproducable builds and to reproduce this build error:
> http://autobuild.buildroot.net/results/046/046dd505feb5e92bdee3d0993366be162da1223a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gd/gd.mk |    7 +++++++
>  1 file changed, 7 insertions(+)

Both patches applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
