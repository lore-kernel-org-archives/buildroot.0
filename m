From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 02 Nov 2011 19:35:51 +0000
Subject: [Buildroot] OT: Using oprofile
Message-ID: <4EB19B97.10902@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know this is slightly off topic, but I assume some buildroot users 
must be doing this...

I want to use oprofile on my target, which I have the basics working 
(using buildroot master). However I am having two problems which I am 
not sure how to work around:

- when trying to profile with vmlinux it fails saying objdump is not 
installed (which it is not). It says I can pass in the kernel range, I'm 
just not sure how to get it.
- the app I would like to profile is stripped and I have no source on 
the target. I want to get more detailed call info so I assume I need to 
copy the collected data back onto my build machine where I can then do 
the analysis. Is this the correct way of doing it? Does anyone have 
examples of what they do.

Any help much appreciated.

Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
