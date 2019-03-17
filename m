From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:49:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: add a unprivileged user
In-Reply-To: <20190205105630.17008-1-adrien@gallouet.fr>
References: <20190205105630.17008-1-adrien@gallouet.fr>
Message-ID: <20190317174946.28ee07a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrien,

On Tue,  5 Feb 2019 10:56:31 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> This commit add a specific unprivileged user for BIRD
> to avoid full root privileges while running.
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>

Could you give a few more details on how/where this new user gets
used ? Your patch only creates it, but it doesn't tweak any init script
or configuration file that would tell the daemon to be started using
this unprivileged user.

Could you provide a bit more details ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
