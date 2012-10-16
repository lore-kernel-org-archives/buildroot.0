From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 19:27:00 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <20121016162825.GA26334@mail.sceen.net>
References: <507D6C50.4060607@wanadoo.fr>
 <20121016142342.GA2131@mail.sceen.net>
 <507D8828.4020007@wanadoo.fr>
 <20121016162825.GA26334@mail.sceen.net>
Message-ID: <20121016192700.01faa4e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Tue, 16 Oct 2012 18:28:25 +0200, Richard Braun wrote:
> On Tue, Oct 16, 2012 at 06:15:36PM +0200, Thierry Bultel wrote:
> > 2) Why does ext2 not work with devtmpfs (the answer is likely
> > somewhere in the kernel sources and I will take a look as well) ?
> 
> A common mistake is forgetting to select the "mount devtmpfs at boot
> time" option (CONFIG_DEVTMPFS_MOUNT).

Yes, but Thierry explicitly said he enabled this option, re-read the
e-mail you're replying to :)

Maybe the devtmpfs mounting done by CONFIG_DEVTMPFS_MOUNT does not take
place when an initrd is used? I honestly don't know, I don't use initrd
personally.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
