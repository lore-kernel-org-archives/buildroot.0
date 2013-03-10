From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:13:55 +0100
Subject: [Buildroot] [PATCH 3/4] directfb: expanding the help strings
In-Reply-To: <513C7AB2.3080000@googlemail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-4-git-send-email-c.schoenert@gmail.com>
 <20130310112701.5ac2f9bc@skate> <513C7AB2.3080000@googlemail.com>
Message-ID: <20130310141355.224bb06d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 10 Mar 2013 13:21:06 +0100, Carsten Schoenert wrote:

> > Indentation is wrong. It should be one tab for "help" and one tab + two
> > spaces for the help text.
> 
> Hmm, I have to check my vim settings, sorry.
> What about modlines in thees files? This would be helpful and it's just
> a one-liner on top of this files.

I don't have a very strong opinion about this, but vim would require
one modeline, Emacs would require another one, some other $editor would
require yet a different one.

I guess it's rather up to your editor to understand that Config.in
should be treated with such or such mode.

> > In addition to that, I'm not sure the wording of the help text is so
> > useful. Something like "This option enables a graphics driver specific
> > to the graphics hardware of the Marvell PXA3xx processor family", would
> > be a bit more useful.
> 
> It have take some times for me to find out what this option is for and
> what kind of devices are supported by this option, so at least directfb
> is something for the frame buffer the most people know the options are
> of course depending on this frame buffer and graphic output related things.
> So I think it's worth to explain a little bit more than just 'it's for
> the Marvel PXA family foo ...'. But yes, we can discuss about the word
> and formulation. ;)
> I will rethink about that.

My only problem with your wording is that it was just the copy/paste
describing what the processor is. The reader may not necessarily see
the relation with the configuration option. So just keep your text, but
at the beginning at a sentence like "This option enables a graphics
driver blablabla".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
