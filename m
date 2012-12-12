From: Richard Braun <rbraun@sceen.net>
Date: Wed, 12 Dec 2012 21:49:22 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <20121212162225.GA15887@mail.sceen.net>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk>
 <20121212162225.GA15887@mail.sceen.net>
Message-ID: <20121212204922.GA1265@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 12, 2012 at 05:22:26PM +0100, Richard Braun wrote:
> On Wed, Dec 12, 2012 at 04:12:49PM -0000, Ted Wood wrote:
> > It starts up OK, loads the kernel and uncompresses it.
> > 
> > It mounts sda and sda1
> > 
> > Then "No filesystem could mount root, tried ext3 vfat msdos iso9660"
> 
> Buildroot doesn't take care of the partition table.
> 
> See http://lists.busybox.net/pipermail/buildroot/2012-August/057536.html
> (and the next message for the unspoiled attached script).

If your problem has nothing to do with the partition table, feel free to
give us more information about it, like the boot log (so that we can see
what is actually mounted).

-- 
Richard Braun
