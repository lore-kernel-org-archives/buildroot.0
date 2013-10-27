From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 17:31:45 +0100
Subject: [Buildroot] [git commit] Makefile: export BUILD_DIR
In-Reply-To: <7EC43AD3B54844BEAC908529E9E57748@JohanW7>
References: <20131024064830.61FC19BB90@busybox.osuosl.org>
 <7EC43AD3B54844BEAC908529E9E57748@JohanW7>
Message-ID: <20131027173145.2a3c931f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 24 Oct 2013 16:53:28 +0200, Sagaert Johan wrote:

> What is the difference between TOPDIR and BASE_DIR variables?

TOPDIR is the root of the Buildroot source tree.

BASE_DIR is the root of where we do the build (i.e output/ by default,
but can be overridden with O=).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
