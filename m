From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jan 2013 11:48:35 +0100
Subject: [Buildroot] [PATCH 1/1] target: add different methods to encode
	passwords
In-Reply-To: <87lic8n110.fsf@dell.be.48ers.dk>
References: <cover.1356890711.git.yann.morin.1998@free.fr>
 <50E73970.8000404@zacarias.com.ar> <87lic8n110.fsf@dell.be.48ers.dk>
Message-ID: <201301051148.35627.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Gustavo, All,

On Friday 04 January 2013 Peter Korsgaard wrote:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>  Gustavo> On 12/30/2012 03:08 PM, Yann E. MORIN wrote:
>  >> Passwords can be encoded in different ways (from the weakest
>  >> to the strongest): des, md5, sha-256, sha-512
>  >> 
>  >> Add a choice entry to select the method, defaulting to 'md5'.

>  Gustavo> However i'd like to see an option where the root password is untouched,
>  Gustavo> probably as default.
> 
>  Gustavo> A slippy finger might get a bad surprise when upgrading to a
>  Gustavo> new buildroot version and sees it's skeleton root password
>  Gustavo> zapped away to nothing by surprise - an error that might take
>  Gustavo> some time to get noticed and might even get shipped.  Regards.
> 
> Hmm, the root passwd stuff should only only be active if the default
> rootfs skeleton is used (so no passwd). I see that's not the case today,
> will fix.

OK, I'm on it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
