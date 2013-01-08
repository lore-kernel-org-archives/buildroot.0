From: Will Moore <will.moore@beraninstruments.com>
Date: Tue, 8 Jan 2013 14:15:01 -0000
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <CAKvQZ_0f=ka=G_66J4kt_mqn_CvnjqpHMUyv-tBa7SQ-LMtMRw@mail.gmail.com>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <CAKvQZ_0f=ka=G_66J4kt_mqn_CvnjqpHMUyv-tBa7SQ-LMtMRw@mail.gmail.com>
Message-ID: <324F5873D88A41258846A0BE8F0F4556@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Willy Lambert
> Sent: 08 January 2013 12:59
> To: Thomas Petazzoni
> 
> 2013/1/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > Dear Ted Wood,
> >
> > On Tue, 8 Jan 2013 11:54:25 -0000, Ted Wood wrote:
> >> I am attempting to remotely debug application code on  my i586 system from
> >> Eclipse.
> >>
-- snip --
> >
> > If you're interested, notice that we are currently developing a Eclipse
> > plugin for Buildroot, which will help to build, remote execute and
> > remote debug applications in the context of Buildroot. The
> > documentation has not yet been fully written, but if you're interested,
> > please let me know so that we can give you the initial starting points.
> > We are very interested in getting some user feedback about those
> > developments.
> >
> 
> Even if not concerned by the thread, I'm interested to have a look at
> this plugin.

+1

I currently configure the eclipse project to pick up the buildroot built cross
tools, built my executables in eclipse, run Dropbear on the target, scp my
executables to the target, in a ssh connection run gdbserver, and configure
eclipse to remote debug using the builtroot built cross tools.  I know from QNX
Momentics there are much slicker ways ...

> 
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
