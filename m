From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 13:52:09 +0200
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
In-Reply-To: <1436336880640-104945.post@n4.nabble.com>
References: <1436336880640-104945.post@n4.nabble.com>
Message-ID: <20150708135209.18da05f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jul 2015 23:28:00 -0700 (PDT), salorob wrote:

> I'm struggling to get mono build in Buildroot. I 'took' the mono and the
> moonlight packages in https://github.com/maximeh.

Don't use this repository. Use the official Buildroot repository
instead.

> I already tried a million different things. (different gcc version,
> different gettext, trying to build on ubuntu/debian) but it all comes down
> to this error after a while:

There are no errors in your e-mail.

> What can i do to get to the bottom of this ?
> 
> If i go into the build/mono directory manually, and issue a .configure and
> make there, it compiles without errors.

Just don't do this: if you call the mono configure script manually
without all the proper environment variables and arguments, it will
build Mono for your host machine, and not for the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
