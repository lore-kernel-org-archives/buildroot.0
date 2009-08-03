From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 3 Aug 2009 16:36:14 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <1248888083-11767-1-git-send-email-daniel@caiaq.de>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
Message-ID: <20090803143614.GK19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 29, 2009 at 07:21:22PM +0200, Daniel Mack wrote:
> Add a new target for libuuid so it can be built without e2fsprogs.
> 
> Signed-off-by: Daniel Mack <daniel@caiaq.de>

Hmm, that didn't work well. Let's give the version below a try. This one
now also selects BR2_PACKAGE_LIBUUID for gupnp.

Daniel
