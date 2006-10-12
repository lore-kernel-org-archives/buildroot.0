From: Will Newton <will.newton@gmail.com>
Date: Thu, 12 Oct 2006 10:13:46 +0100
Subject: [Buildroot] gettext fixes
In-Reply-To: <20061011164707.GA28171@aon.at>
References: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
	<20061011164707.GA28171@aon.at>
Message-ID: <87a5b0800610120213m388e948v2eeb57a629d304cc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/06, Bernhard Fischer <rep.nop@aon.at> wrote:
> On Fri, Oct 06, 2006 at 05:05:49PM +0100, Will Newton wrote:
> >Building gettext with the latest buildroot fails. I've attached a
> >patch that fixes a couple of issues for me.
> >
> >1. am_cv_func_working_getline should be defined or the build fails
> >with undefined "gnu_getline".
> >2. The libintl binary has moved.
>
> Can you please check if gettext-0.15 works better?

Yes, it seems to not need the configure tweak.

> Do you use expat?

No, I'm just building libintl so I can build other things that require
it such as glib.
