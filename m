From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 23:57:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/linphone: port some stuff from
 mediastreamer
In-Reply-To: <1459283426-30883-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459283426-30883-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329235725.54aecc20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 22:30:26 +0200, Bernd Kuhls wrote:
> We need to add some dependencies formerly provided by the mediastreamer
> package, also add --disable-video to make clear that our linphone
> package lacks video support as stated in Config.in.
> 
> Fixes
> http://autobuild.buildroot.net/results/45e/45e605de0488e9e961a536f4d232235c5282522b/
> http://autobuild.buildroot.net/results/ed5/ed508ac3509be8c46670198da8eb0a2ba74835e6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/linphone/linphone.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Can I say again how much I hate bundled libraries?

Applied nonetheless, thanks a lot for quickly looking into the problem,
much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
