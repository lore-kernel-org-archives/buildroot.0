From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:19:52 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on gcc >= 4.8
In-Reply-To: <20180920220118.3497-1-fontaine.fabrice@gmail.com>
References: <20180920220118.3497-1-fontaine.fabrice@gmail.com>
Message-ID: <20180925231952.27ec8377@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 00:01:18 +0200, Fabrice Fontaine wrote:
> sleep_for is not always defined with gcc <= 4.7, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680
> 
> To fix this issue, add a dependency to gcc >= 4.8
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/0dada8dd727f32a4500670f6620adb05943ed0b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
