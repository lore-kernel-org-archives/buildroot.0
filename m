From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:11:44 +0100
Subject: [Buildroot] [PATCH] package/ejabberd: fix ejabberdctl
 permissions
In-Reply-To: <20181205161131.7235-1-johan.oudinet@gmail.com>
References: <20181205161131.7235-1-johan.oudinet@gmail.com>
Message-ID: <20181206211144.6cba5713@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Dec 2018 17:11:31 +0100, Johan Oudinet wrote:
> Allow ejabberd user to run ejabberdctl.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/ejabberd/ejabberd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
