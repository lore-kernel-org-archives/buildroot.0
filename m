From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Oct 2017 22:21:24 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: bump version to
 96344ff7125182989f98d3be8d111952a8f74e15 (the real 2.44)
In-Reply-To: <20171011155932.01b6cf48@windsurf.lan>
References: <20171011131539.19407-1-ps.report@gmx.net>
 <20171011155932.01b6cf48@windsurf.lan>
Message-ID: <20171011222124.4d9e0756@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 11 Oct 2017 15:59:32 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 11 Oct 2017 15:15:39 +0200, Peter Seiderer wrote:
> > Fixes bug 10391 [1].
> > 
> > [1] https://bugs.busybox.net/show_bug.cgi?id=10391
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> I don't think it really fixes bug 10391. Bug 10391 is bogus by itself.
> The update to 96344ff7125182989f98d3be8d111952a8f74e15 doesn't fix
> anything, it only adds support for RPi Zero W.

Saving a download as wiringpi-2.44.tar.gz containing something
identifying itself as 2.42? I would call it a bug (not on the buildroot
side but in the original git repository).

The suggested patch fixes the original complain of Bug 10391:
'WiringPi retrieves wrong (old) version'

Any suggestion on how to reference the bug report otherwise?

Regards,
Peter

> 
> Thomas
