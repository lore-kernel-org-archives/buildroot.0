From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 30 Nov 2006 10:12:37 +0100
Subject: [Buildroot] [PATCH] SDL fix
In-Reply-To: <1164844483.23643.33.camel@dv>
References: <1164844483.23643.33.camel@dv>
Message-ID: <20061130091236.GB31471@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 29, 2006 at 06:54:43PM -0500, Pavel Roskin wrote:
>Add --disable-arts to the configure switches for SDL.  We don't provide
>the arts library, and it's checked for in a way not suitable for cross
>compiling.

Applied, thanks.
