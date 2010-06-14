From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 14 Jun 2010 11:50:02 +1000
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <001801cb0b63$e94b86e0$bbe294a0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Monday, 14 June 2010 4:50 AM
> To: buildroot at uclibc.org
> Cc: Thomas Petazzoni
> Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
> 
> Hello,
> 
> Here is a set of 10 patches that completely rewrites the Linux kernel
> compilation process in Buildroot. It is supposed to be applied on top of
the
> bootloaders-cleanup branch I've sent yesterday.
> 
> I've fairly drastically reduced the number of options to configure the
kernel,
> and particulary removed the horrible mess of version selection. See the
first
> commit in this branch for what remains in terms of configuration options
for
> the kernel. As I've removed quite a few things, I'm interested to know how
> you're using Buildroot to build your kernel, and whether this proposal
still
> matches your use cases.

Looks good to me. The only comment I have is I liked the old automatic
kernel patching from kernel.org, but now you need to know what the latest
version is. No big deal though.


Cheers,
Paul.
