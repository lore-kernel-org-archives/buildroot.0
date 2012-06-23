From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 23 Jun 2012 08:55:32 -0500
Subject: [Buildroot] modify kernel source code
In-Reply-To: <CAFC29aW7ujD0F5UA1HSKHWMufqR-w8hJdTuptbKKRybb+cebvA@mail.gmail.com>
References: <CAFC29aWY59_7+WhjEGx9_3BJm10dCNrj8rkUPSG1LbqfgU+n0g@mail.gmail.com>
 <20120623095704.GA22422@mail.sceen.net>
 <CAFC29aW7ujD0F5UA1HSKHWMufqR-w8hJdTuptbKKRybb+cebvA@mail.gmail.com>
Message-ID: <201206230855.35831.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat June 23 2012, Ron Eggler wrote:
> Oh yeah, great!
> Am I just gonna have a folder containing the patched option.c or am i gonna
> create a patch file with diff that goes in that dir?
> 

Does the configuration parameter have the word: "Patch" or the word: "Source"
in its name?

Mike
> Thanks,
> Ron
> On Jun 23, 2012 2:57 AM, "Richard Braun" <rbraun@sceen.net> wrote:
> 
> > On Fri, Jun 22, 2012 at 05:22:24PM -0700, Ron Eggler wrote:
> > > I want to modify the kernel source code after it's been downloaded
> > > according to these instructions in order to get a driver for my Novatel
> > > MC679 compiled. How can I interrupt the buildroot process once the kernel
> > > sources have been downloaded or how else can I/should I do this?
> > >
> > > Thank you for any suggestions!
> >
> > See the BR2_LINUX_KERNEL_PATCH configuration parameter.
> >
> > --
> > Richard Braun
> >
> 
