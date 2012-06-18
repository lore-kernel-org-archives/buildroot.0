From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 18 Jun 2012 13:55:02 +0100
Subject: [Buildroot] RFC: x11r7.7 patch series
Message-ID: <4FDF2526.70901@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You can find my work on updating to x11r7.7 on gitorious at 
https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7

There are a few parts to the patch series I am not sure about:
- I have deleted all packages not in the 7.7 release, this may remove 
things people still use and feel should still be in buildroot
- I had a problem updating mesa3d. The newer versions rely on host 
libxml2 with python support. There are a couple of patches to do this 
but I don't particularly like these. If someone can come up with 
something better then great.
- There was one package I couldn't compile xdriver_xf86-input-synaptics. 
Didn't spend any time on trying to fix it though (I suspect broken in 
current buildroot as well).

Regards
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
