From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 15:08:14 +0200
Subject: [Buildroot] [PATCH 2 of 2] kmod: add patches to support build
 on Redhat 5
In-Reply-To: <f2b8b2b5efec1b2340c4.1409649946@localhost>
References: <patchbomb.1409649944@localhost>
 <f2b8b2b5efec1b2340c4.1409649946@localhost>
Message-ID: <20141005150814.302e5d43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 02 Sep 2014 11:25:46 +0200, Thomas De Schampheleire wrote:
> # HG changeset patch
> # User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> # Date 1407153133 -7200
> #      Mon Aug 04 13:52:13 2014 +0200
> # Node ID f2b8b2b5efec1b2340c423f14f12df11a95ceac7
> # Parent  2c7735c0247a4c83a3c2ea1d58e74be613465255
> kmod: add patches to support build on Redhat 5
> 
> kmod uses certain features not available on older Redhat 5 machines.
> This commit imports two patches from OpenEmbedded to fix that.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Following the discussion with Peter, I'm marking this patch as Changes
requested in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
