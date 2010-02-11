From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2010 16:35:47 +0100
Subject: [Buildroot] asterisk works in buildroot?
In-Reply-To: <e42c80a1002110658y6dd628bbg419a1062d8f8019@mail.gmail.com>
References: <e42c80a1002110658y6dd628bbg419a1062d8f8019@mail.gmail.com>
Message-ID: <20100211163547.66d65e17@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Makis,

On Thu, 11 Feb 2010 16:58:07 +0200
Makis Tsimaras <tsigian@gmail.com> wrote:

> My question is that is the "depends on BROKEN" line in the
> "package/multimedia/asterisk/Config.in" means that asterisk cannot
> compile and work with Buildroot at all?

It was marked BROKEN because it was known not to work and nobody was
working on getting it working. As it was marked BROKEN since a long
time, Peter Korsgaard (Buildroot maintainer) recently removed asterisk
from the list of available packages.

However, this does not mean that Asterisk cannot be built at all with
Buildroot. It just means that someones needs to make the integration.
So you have basically two choices:

 1) Do the work by yourself if you have the skills and the time.

 2) Hire a consultant with expertise in Buildroot to do the
    integration. It happens that I'm both a Buildroot developer and a
    consultant :-)

Cheers!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
