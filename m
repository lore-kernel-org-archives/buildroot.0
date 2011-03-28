From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2011 09:22:26 +0200
Subject: [Buildroot] Problems with pkg-config
In-Reply-To: <87zkogmjbv.fsf@macbook.be.48ers.dk>
References: <AANLkTinY9SZZs0uBFzCah0oJD5JjTvRR0K7z+B1u=AHd@mail.gmail.com>
	<87zkogmjbv.fsf@macbook.be.48ers.dk>
Message-ID: <20110328092226.4c657301@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Mar 2011 21:53:08 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> The right fix is imho to make pkg-config search usr/share/pkgconfig as
> well, as that's what upstream pkg-config does by default. I've fixed
> it in git (6a86dd9c8e) and dropped the patch we had for xtrans to
> make it use usr/lib/pkgconfig instead.

Agreed. I had a similar problem with some packages looking for udev.pc,
which is looking in usr/share/pkgconfig.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
