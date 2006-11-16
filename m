From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 16 Nov 2006 09:26:57 +0000 (UTC)
Subject: [Buildroot] Configure buildroot to provide /sbin/init (link to
	busybox?)
References: <loom.20061113T172233-107@post.gmane.org> <455B244F.30107@geeo.net>
Message-ID: <loom.20061116T102524-954@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy R. Geeo <jeremy@...> writes:

> 
> MikeW wrote:
> > Should there be (is there !) a menuconfig way for buildroot to provide
> > a /sbin/init entry in the filesystem ?
> > If you don't specify 'init=...' at boot time, the kernel complains
> > about 'no init'.
> >   
> 
> Are you selecting the "Install symlinks for BusyBox applets" in the 
> BusyBox section of your package selection?? It should be putting that 
> link in for you.
> 
> Jeremy R. Geeo
> 

Yes. But after a dirclean/distclean rebuild this seems OK now !?

Thx,
Mike
