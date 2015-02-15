From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Feb 2015 23:37:35 +0100
Subject: [Buildroot] [PATCH] package/dvdauthor: fix static build
In-Reply-To: <87pp9aykxw.fsf@dell.be.48ers.dk>
References: <1423998648-23454-1-git-send-email-romain.naour@openwide.fr>
 <87pp9aykxw.fsf@dell.be.48ers.dk>
Message-ID: <54E11FAF.8070408@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 15/02/2015 21:32, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
> 
>  > Dvdauthor forget to link witk -lbz2 when linking with freetype2.
>  > Fixes:
>  > http://autobuild.buildroot.net/results/1d8/1d83390a3dd9f6bb595e9fc7b321500b4dc533a8/
> 
>  > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Committed, thanks. Don't forget to send the patch upstream.
> 

Already accepted upstream ! :)
https://github.com/ldo/dvdauthor/commit/176172d5dcba4d6e2704a1a2cc48c9e687761996

Best regards,
Romain
