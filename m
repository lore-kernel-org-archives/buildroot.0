From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 18 Dec 2007 12:29:45 +0200
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <1CDF1BC9-C921-4E84-B041-B0CDDF8BF3A1@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
	<6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
	<4766A061.7060308@promwad.com>
	<85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
	<47635.127.0.0.1.1197931767.squirrel@localhost>
	<7E283458-5B84-4AF8-9B2E-7B6D42081922@oregonstate.edu>
	<0FA0EAE7-0236-46E2-94F1-F3C664582A6B@oregonstate.edu>
	<52481.127.0.0.1.1197934593.squirrel@localhost>
	<1CDF1BC9-C921-4E84-B041-B0CDDF8BF3A1@oregonstate.edu>
Message-ID: <4767A119.6070508@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> 
>  From what I've seen, at least for ARM, it's very toolchain dependent.  
> I've tried different versions of gcc, binutils and uClibc, with and  
> without EABI, using soft float and not. The only combination that has  
> worked reliably for me has been the combination I listed above. You  
> might try an older snapshot of buildroot from around May and try gcc  
> 4.0.4. That's the only compiler version I've gotten to work reliably.
> 
> I did finally get a build of the latest trunk of buildroot, but it had  
> a lot of problems. sshd and other non-busybox applications segfault.  
> This was using gcc 4.2.1, binutils 2.18 and a snapshot of uClibc from  
> early december, using softfloat and EABI. I've had to focus on some  
> other issues so I haven't gotten back to it yet. This was still with  
> my 2.6.21.6 kernel I'd built previously, still cannot get a working  
> 2.6.23 kernel with that toolchain.
> 

This link seems mention the same problem (for 2.6.23):
Subject: binutils 2.17.50.0.17 --build-id feature breaks arm kernel build
http://lists.arm.linux.org.uk/lurker/message/20070828.080711.574bb3f0.en.html

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
