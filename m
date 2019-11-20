From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 17:59:23 +0100
Subject: [Buildroot] [next] package/rpcbind: add systemd dependency when
 cfg for systemd
In-Reply-To: <20191120150015.54771-1-matthew.weber@rockwellcollins.com>
References: <20191120150015.54771-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191120175923.1fe3f67a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 09:00:15 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

The commit log is too short. Does it fix a build issue? Why does it
need to have systemd built before? Is it using a library provided by
systemd?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
