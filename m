From: <bogus@does.not.exist.com>
Date: Thu, 17 Aug 2006 01:58:45 -0000
Subject: No subject
Message-ID: <mailman.14.1164378555.4264.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ccache is a fast compiler cache. It is used as a front end to your compiler to safely cache compilation output. When the same code is compiled again the cached output is used giving a significant speedup (typically 5x).


Is this 5x speedup overstated, or why do you have no need for it?
-- 
"Ein Herz f?r Kinder" - Ihre Spende hilft! Aktion: www.deutschlandsegelt.de
Unser Dankesch?n: Ihr Name auf dem Segel der 1. deutschen America's Cup-Yacht!
