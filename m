From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 01 Nov 2006 15:24:29 -0700
Subject: [Buildroot] How to use a buildroot disk image.
In-Reply-To: <20061101222326.633f927f.philippe.ney@pardes.ws>
References: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
	<20061101222326.633f927f.philippe.ney@pardes.ws>
Message-ID: <1162419869.10400.0.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2006-11-01 at 22:23 +0100, Philippe Ney wrote:
> > I'm really sorry if I missed this in the documentation, but how do I
> > install the file system image to an actual disk drive.  I have tried
> > using dd to write it to the disk as super block and also just to the
> > first partition, but this has not worked.  Thanks in advance.
> 
> Depends on the fs type you generated.
> 
> If you generate an ISO image, you could burn it on a cdrom or run it with
> qemu. And if you generate an ext2 fs, you would access it through a loop
> device for example.

Fancy enough, qemu can also use the ext2 fs image to boot from I found out.

-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
