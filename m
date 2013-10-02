From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Wed, 02 Oct 2013 14:33:32 +0200
Subject: [Buildroot] [PATCH v3] Added lesstif support
In-Reply-To: <87vc1gq7qm.fsf@dell.be.48ers.dk>
References: <1380037552-26919-1-git-send-email-thierry.bultel@wanadoo.fr>
 <1380037552-26919-2-git-send-email-thierry.bultel@wanadoo.fr>
 <877gdwu1kc.fsf@dell.be.48ers.dk> <524BEEA7.3080000@wanadoo.fr>
 <87vc1gq7qm.fsf@dell.be.48ers.dk>
Message-ID: <524C129C.8020109@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 02/10/2013 12:37, Peter Korsgaard a ?crit :
>>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:
> 
>  Thierry> Le 01/10/2013 23:24, Peter Korsgaard a ?crit :
>  >>>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:
>  >> 
>  >> The commit message should have been in this email.
>  >> 
>  >> I've added it and committed, thanks.
>  >> 
>  >> I had to pass --no-recursion to not have it error out in test/configure
>  >> though.
>  >> 
> 
>  Thierry> Thanks Peter,
> 
>  Thierry> could you please be more specific about that --no-recustion
>  Thierry> issue that I have missed ?
> 
> Without --no-recursion, ./configure executes test/configure at the end,
> which error'ed out with missing XPrint headers (as far as I
> remember). Perhaps you have a bunch of X development packages installed
> on your build machine?
> 

Yes indeed.
Thanks for having noticed it.
