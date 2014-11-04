From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 4 Nov 2014 09:34:03 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <5457E7C7.9050602@mind.be>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
 <5457E7C7.9050602@mind.be>
Message-ID: <CA+TH9V=zzceRxSj18sOUfXit_SSazjw=JWCc=mfK6V0u9w-GHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

>  This comment makes me realize something: we are only carrying the minified
> version of jquery and bootstrap. As such that's not a problem, because they're
> MIT licensed. However, when you distribute the buildroot source, it is
> conceivable to consider jquery and bootstrap as part of "the Program" according
> to the GPL. In that case, the GPL would require you to provide the complete
> corresponding source, i.e. including the source of jquery and bootstrap.

We could add easily source files, no problem at all, but I don't think
it's necessary:

For jquery, we maintain the original header and the minified file is
unmodified, so I think we are right on this.
For bootstrap, variables.less and bootswatch.less are provided, so
anyone with the right tools (less compiler) could obtain the minified
file again, so I think we are right also here.

>  Although this is probably an unrealistic interpretation of the situation, I
> think it would certainly simplify everybody's life if we would just carry a copy
> of the source of bootstrap and jquery. _Especially_ if we're going to modify it.

Yes and I did it. Jquery is unmodified, so no need to carry the source
file. Bootstrap already have the necessary files to rebuild it in case
of necessity. I think that maintaining source files is cumbersome,
because than we should stay up to date with the mainstream.
Having minified files that serve us and the pieces to rebuilt them is
surely more practical.

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
