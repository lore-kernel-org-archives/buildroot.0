From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:19:01 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libsrtp: fix static build
In-Reply-To: <20180821041640.14089-1-bernd.kuhls@t-online.de>
References: <20180821041640.14089-1-bernd.kuhls@t-online.de>
Message-ID: <20180821111901.00003399@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 06:16:40 +0200, Bernd Kuhls wrote:
> The library name was updated upstream:
> 
> Fixes
> make[1]: *** No rule to make target 'libsrtp.a'.  Stop.
> 
> http://autobuild.buildroot.net/results/10e/10e4198e8d86eecb9c672db77cbaff1e8a592ad3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsrtp/libsrtp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
