From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:30:06 +0200
Subject: [Buildroot] [PATCH v2] package/netplug: init script create
 needed lock directory
In-Reply-To: <20170905095456.15776-1-corjon.j@ecagroup.com>
References: <20170905083917.8625-1-corjon.j@ecagroup.com>
 <20170905095456.15776-1-corjon.j@ecagroup.com>
Message-ID: <20170905213006.12c37c9b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 11:54:56 +0200, Julien Corjon wrote:
> Init script use /var/lock/subsys/netplugd but directory
> /var/lock/subsys can be missing.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
