From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:25:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-06-29
In-Reply-To: <559288ED.3010704@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
 <559288ED.3010704@free-electrons.com>
Message-ID: <20150630142515.636aa6f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jun 2015 09:17:49 -0300, Gustavo Zacarias wrote:

> > I don't know. Gustavo, you are the most active contributor on collectd.
> > Can you have a look?
> 
> It's a parallel build issue, i'll look into it.

Great, thanks.

> > All fixed by
> > http://git.buildroot.net/buildroot/commit/?id=84f6eb9fe3467abbd94a6b481ae5106679d61e24.
> 
> I should have emailed about this earlier, i didn't miss the hash, in 
> fact it's perfectly fine, look at 
> http://download.pureftpd.org/pub/pure-ftpd/releases/distinfo
> The md5 hash stated there matches my previous tarball and my previous 
> tarabll sha256, and the file timestamp predates the tarball... so 
> upstream pulled a switcharoo.
> I'm ok with the revised hash since it matches the signature, but it 
> wasn't my fault :)

Yes, I also suspected that upstream changed the tarball. I didn't meant
to be offensive in any way about your work here, really just wanted to
fix the problem, nothing more. I definitely trust you that the hash was
correct at the time you sent the patch, and that upstream did crap.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
