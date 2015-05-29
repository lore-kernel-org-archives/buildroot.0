From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 29 May 2015 21:46:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: Add musl patches
In-Reply-To: <556770D9.9030001@mind.be>
References: <1432801431-16986-1-git-send-email-joerg.krause@embedded.rocks>
 <556770D9.9030001@mind.be>
Message-ID: <1432928768.3676.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2015-05-28 at 21:47 +0200, Arnout Vandecappelle wrote:
> On 05/28/15 10:23, J?rg Krause wrote:
> > Add patches to fix the following issues:
> >   - shairport-sync crashes on musl libc because of a stack overflow
> >   - warning about incorrect header includes for poll.h and signal.h
> > 
> > Both patches PR'ed upstream:
> > https://github.com/mikebrady/shairport-sync/pull/78
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Patches have been accepted upstream now. Probably good to include in 
> 2015.05.
> 

Thanks for the review!

If we handle runtime errors like build errors I vote for including to
2015.05, too. However, its only relevant for building with musl with is
still marked as experimental.

Since both patches are accepted upstream and a new version is released
we could also just bump the version to 2.2.4.

Best regards
J?rg Krause
