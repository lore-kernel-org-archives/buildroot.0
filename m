From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Apr 2015 18:58:02 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add LWS_ prefix to
 LWS_WITHOUT_TESTAPPS=ON cmake option
In-Reply-To: <1430314740-6112-1-git-send-email-baptiste.moraine@kapelse.com>
References: <1430314740-6112-1-git-send-email-baptiste.moraine@kapelse.com>
Message-ID: <20150429185802.6b7e7625@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baptiste Moraine,

On Wed, 29 Apr 2015 15:39:00 +0200, Baptiste Moraine wrote:
> Currently, libwebsockets.mk is passing -DWITHOUT_TESTAPPS=ON to disable
> the building of libwebsockets test applications, but this is doing nothing
> because the option is really named  LWS_WITHOUT_TESTAPPS.
> This commit fixes that by using the correct option name.
> 
> Signed-off-by: Baptiste Moraine <baptiste.moraine@kapelse.com>
> ---
>  package/libwebsockets/libwebsockets.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
