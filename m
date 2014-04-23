From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 23 Apr 2014 10:56:02 +0200 (CEST)
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <53577F04.1040409@mind.be>
Message-ID: <435816036.13835416.1398243362765.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> > 
> > Also, by having a much smaller percentage, I'm wondering if we have
> > a
> > lot less chances to trigger cases that require a fairly significant
> > combination of options to be produced.
> 
>  Do we actually have examples of such a situation, that a combination
>  of
> packages leads to an error? It's more likely to lead to runtime
> errors I
> expect.
> 


on a side note, if the autobuilder has selected a high number of packages
so far, there are probably many "low number of packages" type of bug
that it could find. it might be interesting to temporarly set it to a
low number of packages...
