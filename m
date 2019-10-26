From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:32:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/bmap-tools: new package
In-Reply-To: <20191026144101.30599-1-nicolas.carrier@orolia.com>
References: <20191026144101.30599-1-nicolas.carrier@orolia.com>
Message-ID: <20191026193241.50a146a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 14:41:18 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> +	  Tool to flash image files to block devices using the block map
> +	  bmaptool is a generic tool for creating the block map (bmap)
> +	  for a file, and copying files using the block map. The idea is
> +	  that large file containing unused blocks, like raw system
> +	  image files, can be copied or flashed a lot faster with
> +	  bmaptool than with traditional tools like "dd" or "cp".

Another question is that you're packaging this for the target, but it
sounds like a tool that would be mainly useful on the host to
prepare/flash a SD card. Do you have a use case for having this tool on
the target ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
