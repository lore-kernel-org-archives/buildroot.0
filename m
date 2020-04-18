From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:22:28 +0200
Subject: [Buildroot] [PATCH v2] package/netsnmp: unix domain socket
 transport
In-Reply-To: <20200414175500.28891-1-matthew.weber@rockwellcollins.com>
References: <20200414175500.28891-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200418182228.083489da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 12:55:00 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Ryan Steffens <ryan.steffens@rockwellcollins.com>
> 
> Adds support for connecting unix socket based AgentX subagents
> 
> Signed-off-by: Ryan Steffens <ryan.steffens@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

I have further extended the commit log, and applied. Especially, it is
always useful to go back in the history of the package and try to
figure out the reason why something was done in a given way, and now
needs to be done differently.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
