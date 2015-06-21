From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:37:16 +0200
Subject: [Buildroot] [PATCH 1/1] fluxbox: explicitly configure optional
 dependencies
In-Reply-To: <1434734265-10216-1-git-send-email-james.knight@rockwellcollins.com>
References: <1434734265-10216-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150621063716.4f42be45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 19 Jun 2015 13:17:45 -0400, James Knight wrote:
> The following commit explicitly configures optional dependencies based
> off the respective package selections for a given configuration.
> 
> In addition, this commit also cleans up some obsolete/incorrect
> arguments. With the introduction of (at least) Fluxbox 1.3.7, the
> '--with-imlib2-prefix' argument no longer exists. The argument
> '--with-xpm-prefix' has never existed; it was accidentally committed
> mimicking the configuration used to provide imlib2.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/fluxbox/fluxbox.mk | 53 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
