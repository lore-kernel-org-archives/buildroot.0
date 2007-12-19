From: hartleys <hartleys@visionengravers.com>
Date: Wed, 19 Dec 2007 13:00:58 -0500
Subject: [Buildroot] readline
Message-ID: <1CF6EDDF0820924DA43C9A52FE73259506F9621E@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am trying to cross compile readline for use on a Cirrus EP9307 ARM
processor. During the .configure stage I get the following warning
message:

configure: WARNING: termcap.h: accepted by the compiler, rejected by the
preprocessor!
configure: WARNING: termcap.h: proceeding with the compiler's result

Is this something I need to worry about?

Also, I end up with the readline headers being installed to my target
($(TARGET_DIR)?). I only need them in in my host ($(STAGING_DIR)?) but I
need the shared libraries installed to the target?

Basically I don't really get how this works. Could someone point me in
the right direction?

Thanks,
Hartley
