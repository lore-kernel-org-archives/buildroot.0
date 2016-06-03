From: Charles Hardin <ckhardin@exablox.com>
Date: Fri, 3 Jun 2016 16:11:04 -0700
Subject: [Buildroot]  external toolchains just seem to be compilers
Message-ID: <381C5F65-B7BC-44C6-8B50-012432186920@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, we have to build a few different images and it would be ?nice" to not have to
rebuild host-python and just use that from an external toolchain? I know the big
concern would be version mismatch - so, make a config option???

Also, the other languages of choice are ?go? and ?rust? and it is really annoying
to have to re-bootstramp go and rust compilers instead of just including them
from external toolchain?

Is anyone else playing in these murky waters? Thanks in advance.
Charles

?
Bits go in, bytes go out
