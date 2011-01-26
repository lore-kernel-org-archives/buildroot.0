From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 14:10:57 +0100
Subject: [Buildroot] Problem compiling busybox with libpam
In-Reply-To: <87bp33vqwv.fsf@macbook.be.48ers.dk>
References: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
	<87bp33vqwv.fsf@macbook.be.48ers.dk>
Message-ID: <20110126141057.2be8a686@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jan 2011 12:35:28 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> There's no pam support in uClibc/buildroot, so this can only work if you
> use an external glibc toolchain with pam support.

Hum, I'm not familiar at all with PAM, but it looks like it's a separate
library from the C library. At least on Debian systems,
security/pam_*.h are coming from libpam0g-dev, and the library is in
libpam0g, both of which are coming from the Linux-PAM project it seems.

How does it relate to the choosen C library ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
