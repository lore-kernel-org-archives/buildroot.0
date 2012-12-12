From: Richard Braun <rbraun@sceen.net>
Date: Wed, 12 Dec 2012 17:22:26 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <000901cdd883$889a6e70$99cf4b50$@co.uk>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk>
Message-ID: <20121212162225.GA15887@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 12, 2012 at 04:12:49PM -0000, Ted Wood wrote:
> It starts up OK, loads the kernel and uncompresses it.
> 
> It mounts sda and sda1
> 
> Then "No filesystem could mount root, tried ext3 vfat msdos iso9660"

Buildroot doesn't take care of the partition table.

See http://lists.busybox.net/pipermail/buildroot/2012-August/057536.html
(and the next message for the unspoiled attached script).

-- 
Richard Braun
