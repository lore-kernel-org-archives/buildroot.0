From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 15:40:52 +0100
Subject: [Buildroot] [PATCH] tstools: GitHub migration
In-Reply-To: <87y4exip9l.fsf@dell.be.48ers.dk>
References: <1445346374-21146-1-git-send-email-Vincent.Riera@imgtec.com>
 <87y4exip9l.fsf@dell.be.48ers.dk>
Message-ID: <56265274.6040402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2015 03:32 PM, Peter Korsgaard wrote:
[snip]
>  > +# tstools doesn't have any license so far. See:
>  > +# https://github.com/kynesim/tstools/issues/32
>  > +TSTOOLS_LICENSE =
>  > +TSTOOLS_LICENSE_FILES =
> 
> While it is correct that the upstream repo doesn't include a copy of the
> license file, plenty (all?) source files clearly list that they are
> under the MPL v1.1 license:
> 
> grep -rls 'MPL v1.1'
> tsplay_fns.h
> ipv4.h
...
[snip]

> So I've kept the license as MPLv1.1 and adjusted the comment to make it
> clear that it is just the license file we are missing.

Ooops, I see. Thanks Peter!

> Committed with that fixed, thanks.
> 
