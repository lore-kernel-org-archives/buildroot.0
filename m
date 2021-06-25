From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jun 2021 14:46:28 +0200
Subject: [Buildroot] [PATCH v6 4/5]
 support/testing/tests/package/test_bmap_tools: new test
In-Reply-To: <20210625123657.GE104638@scaer>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-5-thomas.petazzoni@bootlin.com>
 <20210625123657.GE104638@scaer>
Message-ID: <20210625144628.5d5cdcb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Jun 2021 14:36:57 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +# do a test copy of the file system image
> > +bmaptool create -o disk.img.bmap disk.img
> > +bmaptool copy disk.img copy.img  
> 
> It is sad that the copy was not actually tested to be identical to the
> original, so I added:
> 
>     cmp disk.img copy.img
> 
> and applied to master, thanks.

Good point, thanks for the change!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
