From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:25:30 +0200
Subject: [Buildroot] [PATCH] add sob line for patch series
In-Reply-To: <20140729165051.GC32743@waldemar-brodkorb.de>
References: <20140729150130.GA25263@waldemar-brodkorb.de>
 <20140729184532.40a961ab@free-electrons.com>
 <20140729165051.GC32743@waldemar-brodkorb.de>
Message-ID: <20140729202530.3b999263@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 29 Jul 2014 18:50:52 +0200, Waldemar Brodkorb wrote:

> > I think the best practice should rather be to SoB when committing (i.e
> > 'git commit -s') rather than when formatting patches, no?
> 
> The example above in the manual is using -s for format-patch.

Ok, so I've applied your patch, but I had once again to fixup the
commit log. There was no prefix, and the commit log was a bit too
terse. If you could try to do slightly better commit logs, it'd be nice.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
