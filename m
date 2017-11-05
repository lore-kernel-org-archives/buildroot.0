From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:59:50 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <87po8x2jh8.fsf@dell.be.48ers.dk>
References: <1509720041684-0.post@n4.nabble.com> <20171105083549.GD2996@scaer>
 <87po8x2jh8.fsf@dell.be.48ers.dk>
Message-ID: <20171105085950.GH2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-11-05 09:54 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > However, if you really, like realy-really, want to override it to
>  > something else, then just export SOURCE_DATE_EPOCH before calling
>  > Buildroot.
> 
> We afaik don't support this yet as SOURCE_DATE_EPOCH is unconditionally
> exported, but that could get fixed naturally.

Ah, rioght, we do have a bug here: we must keep it as-is if it set.

I'll cook-up a patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
