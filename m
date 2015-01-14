From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:35:45 +0100
Subject: [Buildroot] [PATCH 1/2] squid: create a user/group
In-Reply-To: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114203545.039d5f29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 16:14:43 -0300, Gustavo Zacarias wrote:
> Even though squid uses nobody/nogroup it ain't good for security if
> every daemon around uses it, specially since squid is used as a caching
> proxy most of the time and that would mean other daemons/scripts run as
> nobody would have access to potentially sensitive information.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/squid/squid.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
