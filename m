From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:49:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-07-08
In-Reply-To: <20170710185452.GA22803@waldemar-brodkorb.de>
References: <20170709063052.6F78221DB3@mail.free-electrons.com>
 <480602992.4326585.1499689836292.JavaMail.zimbra@datacom.ind.br>
 <20170710144340.4fab6bd4@windsurf.lan>
 <87lgnwtoth.fsf@dell.be.48ers.dk>
 <20170710185452.GA22803@waldemar-brodkorb.de>
Message-ID: <20170710234901.221eb3a2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 20:54:52 +0200, Waldemar Brodkorb wrote:

> > Sorry, no idea. gcc68 is a new Ryzen based machine in the compile farm
> > that I recently started an autobuilder instance on:
> > 
> > https://cfarm.tetaneutral.net/machines/list/
> > 
> > I'll try to reproduce manually and have a closer look tonight.  
> 
> I have seen a lot of illegal instruction errors from the host gcc
> on this machine. (also on gcc67).
> 
> Dunno if the Debian is too old or what is the reason.
> 
> So the problems are not specific to buildroot.

OK, so perhaps it is better to stop the autobuilder instance from this
machine, and other, more stable machines.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
