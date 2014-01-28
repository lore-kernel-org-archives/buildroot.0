From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 28 Jan 2014 09:42:30 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <1390745969170-60687.post@n4.nabble.com>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric>
 <1390290077263-60414.post@n4.nabble.com>
 <20140121173657.GA11605@pc-eric>
 <1390420630566-60535.post@n4.nabble.com>
 <20140123170253.GB10856@pc-eric> <20140124182659.GB30974@pc-eric>
 <1390745969170-60687.post@n4.nabble.com>
Message-ID: <20140128084229.GA30106@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Just FYI I've build your gobject package successfully on a 32-bit host so
> you're last point was totally right.
I've found a x86_64 machine to perform tests. I've patched the configure.ac
files of the packages so that the path to the Python headers can be overriden
from Buildroot Makefiles. The fix is available in my branch.

Best regards,
ELB
