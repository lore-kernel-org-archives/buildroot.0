From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:36:05 +0200
Subject: [Buildroot] [PATCH] x11r7: xdriver_xf86-input-tslib: add the
 hash for the COPYING license file
In-Reply-To: <20171002131245.6056-1-martink@posteo.de>
References: <20171002131245.6056-1-martink@posteo.de>
Message-ID: <20171002213605.26ca308a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Oct 2017 15:12:45 +0200, Martin Kepplinger wrote:

> +# Locally computed
> +sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING

It doesn't work here:

>>> xdriver_xf86-input-tslib 1.1.1 Collecting legal info
ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9
ERROR: got     : edfc46c9b91499699fc54d39e986756a2dcce8a919c6066be177123441532856
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
