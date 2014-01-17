From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 17 Jan 2014 16:44:54 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
Message-ID: <20140117154452.GC10730@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 17, 2014 at 01:39:19PM +0100, Freedreamer wrote:
>    now i've been using python 2.7. you confirm there is no package?

Adding a new package for python-gobject 2.28 is pretty straightforward. I
did it in my repo:
https://github.com/elebihan/buildroot/commit/4107b0e4549aa4a234496c840361528381f57edf.

I wrote a test script where I subclassed gobject.GObject and tested it on an
emulated ARM platform: the code works without problems, though GLib emits a
warning about the props being initialized after class init.

Best regards,
ELB
