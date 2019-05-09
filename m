From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 21:43:48 +0200
Subject: [Buildroot] Fwd: [autobuild.buildroot.net] Your build results
 for 2019-05-08
In-Reply-To: <CAMQcK5J5YUv4nYfdFpZhRnO6uy+5i6Rpnxa6nGXcZNQDTA3zGw@mail.gmail.com>
References: <20190509060040.D56B7604B6@crulimr01.rockwellcollins.com>
 <CAMQcK5J5YUv4nYfdFpZhRnO6uy+5i6Rpnxa6nGXcZNQDTA3zGw@mail.gmail.com>
Message-ID: <20190509214348.1d45d19e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Thu, 9 May 2019 08:55:43 -0500
Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:

> [following]
> --2019-05-08 14:47:04--
> https://sourceforge.net/projects/atftp/files/atftp-0.7.2.tar.gz
> Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
> GnuTLS: A TLS fatal alert has been received.
> Unable to establish SSL connection.
> 
> These were both run on the autobuilder from Thomas so it may be a
> build server configuration issue.

It is a bug in the old version of wget/gnutls that is used in my old
Debian Wheezy chroot. It disappears once the tarball is cached in
sources.buildroot.net.

I should probably update my chroot to Debian Jessie, now that Debian
Wheezy is completely EOLed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
