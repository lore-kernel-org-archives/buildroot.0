From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:04:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: install resolv.conf
 with systemd resolve instead of networkd
In-Reply-To: <20190811193648.41690-1-james.hilliard1@gmail.com>
References: <20190811193648.41690-1-james.hilliard1@gmail.com>
Message-ID: <20191027100403.44290f40@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sun, 11 Aug 2019 13:36:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes: https://bugs.busybox.net/show_bug.cgi?id=9881
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

We forgot about your patch, and Carlos recently submitted a similar
patch, which we merged in 0e51737575bcfbe573c8fe156f1e4a5408aad0fa.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
