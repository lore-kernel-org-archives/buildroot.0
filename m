From: William Wagner <will_wagner@carallon.com>
Date: Wed, 15 Sep 2010 19:17:03 +0100
Subject: [Buildroot] external toolchain question
Message-ID: <4C910D9F.2060308@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hello,

I'm trying to get a crosstool-ng toolchain working and running into a 
few problems. One thing I found with c++ support was that libstdc++ was 
being copied into target/usr/lib but it was located in staging/lib.

It seems like this commit 
http://git.buildroot.net/buildroot/commit/?id=ecb7642cce36bc68d93f0eee677adc7da538228d 
explicitly moved it in the target. The comment appears to be for an 
external buildroot toolchain not a crosstools toochain. Is that why it 
works for some people? For my crosstools toolchain it seemed that moving 
it fixed my problem.

As an aside what is the status of using a buildroot generated toolchain 
as an external toolchain? Any instructions anywhere on how to do it?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
