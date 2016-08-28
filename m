From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 23:48:05 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <87twe4aav2.fsf@dell.be.48ers.dk>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <87twe4aav2.fsf@dell.be.48ers.dk>
Message-ID: <20160828214805.GE5758@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-08-28 22:37 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Peter, Yann,
>  > Peter: do you have an opinion on this patch. If not, I think I'm going
>  > to apply it, so please raise your opinion if you disagree.
> 
> There probably are users of the option somewhere, so removing it will be
> a bit annoying for them

There are *always* users of any option we deprecate or remove.

All we can do is make it easy for them to upgrade. Override-srcdir has
been available for ages now (5 years in September), so it's not as if
it were something new or complex to use.

> - But changing to override srcdir should be
> fairly simple so I'm fine with it (for next).

Yes, obviously that's for next now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
