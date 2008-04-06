From: Micha Holzmann <holzmann@gmx.de>
Date: Sun, 6 Apr 2008 12:42:32 +0200
Subject: [Buildroot] Problems after building rootfs.i386.ext2
In-Reply-To: <46a136670803140914h6843f70csaf9bd46da581f194@mail.gmail.com>
References: <20080313160410.GA13136@mail.mhnet.de>
	<46a136670803130959n7d6cfcaxf8eb0a78d93acf71@mail.gmail.com>
	<20080314142333.GA14688@mail.mhnet.de>
	<46a136670803140914h6843f70csaf9bd46da581f194@mail.gmail.com>
Message-ID: <20080406104232.GB3033@gandalf.pf.mhnet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

John Voltz wrote:
> In the latest buildroot, there is a shell script located in the
> scripts directory called build-ext3-img. It will build a bootable ext3
> image that can be run using qemu or vmware (you have to convert the
> image to vmdk to use it with vmware, see qemu-img). You might try this
> instead. Take a look inside the script to see how it works.

this helps a lot. At least i assume it was a broken g++ installation on
my machine. After reinstalling the package and check the links the
decribed behavior has gone.

Many thanks for your hints.

Best regards,
Micha Holzmann

-- 
$> man woman
$> Segmentation fault (core dumped)
