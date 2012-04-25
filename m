From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 25 Apr 2012 18:41:32 +0100
Subject: [Buildroot] Problem with host packages
Message-ID: <4F98374C.7010701@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been working on updating the xorg components and as part of that 
I need to update mesa3d. Newer version of this require that you have 
python libxml2 support.

Currently for host-libxml2 python support is disabled. I can change that 
so that it builds python support but that then means you have to build 
host-python any time you want host-libxml2. When building for the target 
we are able to see what is selected for the target and conditionally 
change what options are used. Is there an equivalent mechanism for doing 
this with host packages?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
