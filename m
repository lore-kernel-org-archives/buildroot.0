From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 10 Apr 2012 14:18:20 -0400
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <4F84662D.8070906@relinux.de>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>
 <4F803D6E.2020402@relinux.de>
 <CA+-urNS5R_3bUY_SjVFFE3nMfdDN60O_-jJALKzo3cpu2my0fw@mail.gmail.com>
 <4F84662D.8070906@relinux.de>
Message-ID: <CA+-urNSUrDiZP60u60binQ8=HeWBuxHEjLs4DnOGGdf_akFeGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 10, 2012 at 12:56 PM, Stephan Hoffmann <sho@relinux.de> wrote:
> at least, I prefer having ext3;-) ?What would be a reason to stick to ext2?

I had thought that Buildroot did not support creating root filesystems
with ext3 or later. Do you run tunefs in a post-build script to add
the journal? Also, I thought that busybox didn't support creating and
checking ext3 or later?

I'm hoping that I'm wrong. I've been hearing about performance gains
with ext4 extents and would like to see if they help on my projects.
FWIW, I usually mount my rootfs read-only and have a writable data
partition that can be reformatted should it get corrupted too badly.

Thanks,
Frank
