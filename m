From: John Stile <john@stilen.com>
Date: Tue, 29 Jan 2013 17:33:06 -0800
Subject: [Buildroot] making a second small failsafe file system
Message-ID: <1359509586.7974.207.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a board with 8Mb of NOR and 256Mb of NAND.

I plan to normally use NAND, divided into redundant halves, but if
neither half can boot, I would like a failsafe minimal file system on
NOR in order to re-image NAND over the network.

What are my options?  

Do I maintain a separate buildroot just for that failsafe?

Should I create a post-build script that assembles a tiny file system
image?

Has anyone tired this?
