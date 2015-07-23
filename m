From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 23 Jul 2015 08:08:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-filesystem needs
 wchar
In-Reply-To: <20150722085507.4f78d81f@free-electrons.com>
References: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
 <20150722085507.4f78d81f@free-electrons.com>
Message-ID: <1437631717.6881.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Mi, 2015-07-22 at 08:55 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Fri, 17 Jul 2015 16:15:16 +0200, J?rg Krause wrote:
> > Also add reverse dependency for cc-tool.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f0
> > 17442c48244ffd8e/
> > http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f0
> > 17442c48244ffd8e/
> > http://autobuild.buildroot.net/results/0dd/0dd3ef96bbd034a41d908cda
> > a6552b27fda78132/
> > http://autobuild.buildroot.net/results/34b/34b55b2cd83fd5d87af4a9c1
> > 5d05094b16ef3960/
> > 
> > and many more
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Apparently, this isn't sufficient to fix all problems:
> 
>   http://autobuild.buildroot.net/results/49f/49f5c0521fc90fbd4673ad23
> 3ff679be007d2953/build-end.log
> 
> 
> Maybe we should make the entire boost package depends on wchar and be
> done with it?

I will check a build with all boost modules enabled. If there are too
many depending on wchar, let's say more then four or five, we can do it
this way.

Best regards
J?rg Krause
