From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 15:28:41 +0200
Subject: [Buildroot] [PATCH] netplug: look for init script
 configurations at /etc/default/
In-Reply-To: <20180605022459.13790-1-casantos@datacom.com.br>
References: <20180605022459.13790-1-casantos@datacom.com.br>
Message-ID: <20180606152841.0fb9e1f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 23:24:59 -0300, Carlos Santos wrote:
> We are working to make all sysvinit scripts conformant to a pattern and
> /etc/default/ seems to be a good choice, since 34 packages already get
> optional configurations from files at that directory.
> 
> netplug still installs an init script at /etc/rc.d/init.d/.  This will
> be fixed in a future patch that will refactor the init scripts.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Since you're looking at netplug, perhaps you could look at
https://bugs.busybox.net/show_bug.cgi?id=10661 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
