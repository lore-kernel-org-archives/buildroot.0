From: <bogus@does.not.exist.com>
Date: Thu, 17 Aug 2006 01:58:45 -0000
Subject: No subject
Message-ID: <mailman.15.1164378919.4264.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ccache is a fast compiler cache. It is used as a front end to your compiler to safely cache compilation output. 
When the same code is compiled again the cached output is used giving a significant speedup (typically 5x).


Is this 5x speedup overstated, or why do you have no need for it?

-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
