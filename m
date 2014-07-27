From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:30:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: Fix static build
In-Reply-To: <1406447840-8331-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406447840-8331-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140727103034.09ff0505@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 27 Jul 2014 09:57:20 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/04c/04cc4f4878466715d980442bd7114fecbeb51c0b/
> 
> Quote from README:
> 
> A shared library is now built by default, in addition to the static
> library. You can also turn it off if desired
> 
>   $ make SHARED=
> 
> The rtmpdump programs still link to the static library, regardless.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rtmpdump/rtmpdump.mk |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
