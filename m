From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 09:53:45 +0100
Subject: [Buildroot] targetting buildroot at vmware
In-Reply-To: <Pine.LNX.4.64.0612112143590.26350@q7.q7.com>
References: <Pine.LNX.4.64.0612112143590.26350@q7.q7.com>
Message-ID: <20061212085344.GA5002@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 11, 2006 at 09:45:36PM -0800, Joe Pruett wrote:
>i haven't found any obvious hits on the web yet, but it seems like this 
>shouldn't be too hard.  i want to make a very small vmware image using 
>buildroot.  has anyone else done this and have suggestions?  i figure i'll 
>just start with defaults for 386 and see where i get...

There is no difference whether you build a rootfs for real hardware or
for any simulator, be it vmware, bochs, plex86, qemu, you-name-it). Just
build your rootfs, install a bootloader into an empty "disk" (you'd
normally use a file for this) and put your rootfs into a partition on
your "disk". Boot and enjoy.
