From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:11:44 +0200
Subject: [Buildroot] [PATCH 1/3] ejabberd: start the daemon as ejabberd
 user
In-Reply-To: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
References: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150419111144.5c9acb2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed, 15 Apr 2015 17:39:05 +0200, Johan Oudinet wrote:
> ejabberd.mk creates an ejabberd user but the init script was starting
> the xmpp server as root user. This patch fixes it by invoking
> ejabberctl from a "su ejabberd -c" command.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/ejabberd/S50ejabberd | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
