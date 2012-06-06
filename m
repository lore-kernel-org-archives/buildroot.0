From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 6 Jun 2012 15:41:16 -0700
Subject: [Buildroot] busybox 1.18.3 to 1.18.4
Message-ID: <CALo-6+h1Yq_rM_1inqvMVr8X14q45zBmoy_Zeo937G5p2uxWww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am just finishing a project with buildroot-2011.03 and need to
change one thing before the end and that is the version of busybox
from 1.18.3 to 1.18.4.

Make xconfig does not have a 1.18.4 option for this version and
editing .config doesnt work. That is, the next make changes the
busybox version back from 1.18.4 to 1.18.3.

Can someone please tell me which other file would need to be changed
so that I can change the project from busybox 1.18.3 to 1.18.4.

-- 
Charles Krinke
