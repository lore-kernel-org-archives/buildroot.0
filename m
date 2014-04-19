From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 14:11:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-10
In-Reply-To: <53515283.5060106@mind.be>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
 <20140411065158.0a9308de@core2quad.morethan.org>
 <20140411141346.49e1251a@skate> <20140411123931.GZ4096@tarshish>
 <20140411145923.21a38b08@skate> <87r4543r0z.fsf@dell.be.48ers.dk>
 <53515283.5060106@mind.be>
Message-ID: <20140419141127.3fd481dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 18 Apr 2014 18:27:47 +0200, Arnout Vandecappelle wrote:

> > Seems like a bug to me. I don't see how this could ever be valid
> > behaviour.
> 
>  Could also be a bug in the server: if it claims to support the Range:
> option, then wget will try to use it. But if the server then returns the
> start of the file instead of the request offset, you'll end up with this
> corrupted file.

Ah, correct, that's also a possibility. Not sure what we can do about
it, though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
