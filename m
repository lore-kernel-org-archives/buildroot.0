From: Ryan Ordway <rordway@oregonstate.edu>
Date: Wed, 12 Dec 2007 12:17:14 -0800
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
Message-ID: <6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've been using Buildroot with a board based on the AT91SAM9260. I was  
able to get a successful kernel build (2.6.21.6) and buildroot build  
(buildroot-atmel-20070521) using gcc 4.0.4, binutils 2.17 and uClibc  
0.9.28.3. I've been trying to get an updated build from various  
different versions of buildroot from buildrooot-atmel-20070607,  
buildroot-trunk, etc. and while things build fine with some tweaking  
none of the toolchain combinations seem to generate working binaries.  
I've tried using EABI vs. OABI, softfloat for gcc, NWFPE vs. FastFPE,  
etc. The only combination that I can get to work reliably are gcc  
4.0.4, binutils 2.17 and uClibc 0.9.28.3 with my 2.6.21.6 kernel with  
AT91 patches for 2.6.21 applied.

Is there a magic compiler, binutils and uClibc trinity for Linux/ARM  
in particular?

Thanks!

Ryan

--
Ryan Ordway                           E-mail: rordway at oregonstate.edu
Unix Systems Administrator               rordway at library.oregonstate.edu
OSU Libraries, Corvallis, OR 97331    Office: Valley Library #4657
