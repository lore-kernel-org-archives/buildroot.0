From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 28 Feb 2012 13:54:06 +0100
Subject: [Buildroot] build of e2fsprogs fails (2012.02-rc3)
In-Reply-To: <59807857ff1ce335fc4e3042f1db053b@zacarias.com.ar>
References: <1330427777.2274.27.camel@sven>
 <3d41058a0f241311e2b0fe5c2e3c9d1c@zacarias.com.ar>
 <1330432739.2274.31.camel@sven>
 <59807857ff1ce335fc4e3042f1db053b@zacarias.com.ar>
Message-ID: <1330433646.2274.34.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2012-02-28 at 09:49 -0300, Gustavo Zacarias wrote:
> On 2012-02-28 09:38, Sven Neumann wrote:
> 
> > Well, this probably used to be a default uclibc configuration three
> > years ago. Since then we have updated buildroot several times and
> > obviously our ubclibc configuration diverged. What would be the best 
> > way
> > to go back to the default uclibc configuration?
> >
> > Nevertheless, you should consider the patch I've sent as the
> > BR2_PACKAGE_E2FSPROGS_E4DEFRAG option is currently not correctly
> > handled.
> >
> >
> > Regards,
> > Sven
> 
> It's likely, since then many new packages started using ftw extensively 
> so the default configuration was updated, precisely by Thomas on April 
> 2010.

OK, I am now trying builds with the default uclibc configuration. I
don't remember why exactly we started to use a custom config file some
years ago. It was probably just because we did not know that this was a
bad idea that would bite us later.


Thanks for your help,
Sven
