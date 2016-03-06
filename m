From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:13:08 +0100
Subject: [Buildroot] [PATCH] procrank_linux: new package
In-Reply-To: <56CCD0A2.9080402@mind.be>
References: <1456242888-23322-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56CCC087.9060506@mind.be> <56CCC2BE.6060901@free-electrons.com>
 <56CCD0A2.9080402@mind.be>
Message-ID: <20160306161308.74e59b88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 23 Feb 2016 22:35:30 +0100, Arnout Vandecappelle wrote:

> > Actually bfin flat builds fine, it's on my testing rotation for static builds
> > when there's no need for mmu since it uses an old gcc and it's quick to catch
> > "newer version required" scenarios (everything quite old and funky).
> > That being said i had a previous version that i wasn't quick enough to submit
> > that had a patch which was removed since upstream was quick enough accepting the
> > pull (musl build fix).
> 
>  Well, it _builds_ file, but are you sure it's still generating a
> flat/sep/shared binary?

I've just tested, and:

$ file output/target/usr/bin/procrank 
output/target/usr/bin/procrank: BFLT executable - version 4 ram

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
