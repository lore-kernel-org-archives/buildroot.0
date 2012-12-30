From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2012 18:15:34 +0100
Subject: [Buildroot] [PATCH 2/2] target: add different methods to encode
	the root password
In-Reply-To: <87623jtqv5.fsf@dell.be.48ers.dk>
References: <cover.1356739565.git.yann.morin.1998@free.fr>
 <9a13fa348b5d4f9039c48e2ec539256d567d7483.1356739565.git.yann.morin.1998@free.fr>
 <87623jtqv5.fsf@dell.be.48ers.dk>
Message-ID: <201212301815.34408.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 30 December 2012 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> The password can be encoded in different ways (from the weakest
>  Yann> to the strongest): des, md5, sha-256, sha-512
> 
>  Yann> Add a choice entry to select the method, defaulting to 'md5'.
> 
> Care to respin this on top of mainline (E.G. after I changed the logic)?

Yes, I'll do.
Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
