From: Jonathan Haws <Jonathan.Haws@sdl.usu.edu>
Date: Tue, 17 May 2011 15:13:32 +0000
Subject: [Buildroot] Building x86_64 Toolchain
In-Reply-To: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DE492@Mercury.usurf.usu.edu>
References: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
	<20110517085847.46aa97fc@surf>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DE492@Mercury.usurf.usu.edu>
Message-ID: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DF4C1@Mercury.usurf.usu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Turns out I am now getting new errors.  I upgraded buildroot to the latest snapshot and reworked my config file (which I have attached).  The main change is I went to uClibc 0.9.32-rc3 from 0.9.31. 

I was looking though things and found that the libiberty config.log is showing multiple errors.  Could this be the culprit?  The config.log is attached.

Thanks!

Jonathan


-------------- next part --------------
A non-text attachment was scrubbed...
Name: libiberty-config.log
Type: application/octet-stream
Size: 174443 bytes
Desc: libiberty-config.log
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110517/2e2d0308/attachment-0001.obj>
