From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 12 Oct 2006 12:15:33 +0200
Subject: [Buildroot] gettext fixes
In-Reply-To: <87a5b0800610120213m388e948v2eeb57a629d304cc@mail.gmail.com>
References: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
	<20061011164707.GA28171@aon.at>
	<87a5b0800610120213m388e948v2eeb57a629d304cc@mail.gmail.com>
Message-ID: <20061012101533.GB2704@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 12, 2006 at 10:13:46AM +0100, Will Newton wrote:
> >
> > Can you please check if gettext-0.15 works better?
> 
> Yes, it seems to not need the configure tweak.

I didn't need to hack alot to get it working either.

> No, I'm just building libintl so I can build other things that require
> it such as glib.

I am trying to build glib2.0 and it barfed on missing gettext or gettext
support in the libc but I have enabled it for uClibc in the config. 

isn't it enough? (Using 0.9.28 so it may lack some of the needed
features?)


Thomas.
