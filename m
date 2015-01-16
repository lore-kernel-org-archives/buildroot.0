From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:22:47 +0100
Subject: [Buildroot] NFS boot
In-Reply-To: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
References: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
Message-ID: <20150116222247.77a1c18a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Santhosh Ramani,

On Fri, 16 Jan 2015 11:48:08 -0600, Santhosh Ramani wrote:

> Later I changed the S40network script on the NFS file system to not start
> the network if it's NFS mount and then it worked. S40network is a buildroot
> generated script - am I missing something in the config that will generate
> the correct S40network script to allow NFS mount as well.

What is the contents of your /etc/network/interfaces file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
