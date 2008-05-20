From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Tue, 20 May 2008 14:38:53 -0400
Subject: [Buildroot] Bootloaders
In-Reply-To: <326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>	
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>	
	<48330E51.6050505@dspfl.com>
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>
Message-ID: <48331ABD.1060907@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arun Reddy wrote:

> As for the grub.mk <http://grub.mk> modification, can you post the exact 
> error you get with the debian site not being able to be resolved? I can 
> cross reference that with my own grub.mk <http://grub.mk> and see where 
> I downloaded grub from.

wget fails to get 
http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz

Fails with a 404 Not Found.

If I ftp manually to that site, the file is indeed not there.


Jason Valenzuela
