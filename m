From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 30 Sep 2010 23:20:54 +0200
Subject: [Buildroot] [PATCH 1/2] host tools: create the host sed in
	$(O)/host/
In-Reply-To: <87bp7fx7dw.fsf@macbook.be.48ers.dk>
References: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1284926049-9882-2-git-send-email-yann.morin.1998@anciens.enib.fr>
	<87bp7fx7dw.fsf@macbook.be.48ers.dk>
Message-ID: <201009302320.54176.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Thursday 30 September 2010 23:12:59 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
>  Yann> The host sed does not belong to $(O)toolchain/ but
>  Yann> really belongs to $(O)/host/
> Thanks, but this is broken (and so was what we had), so I prefer to just
> get rid of it - It's not difficult to install a working sed on your
> build machine.

I was expecting we would have to get rid of the host sed stuff, but I did
not have time to properly do it before I submit the CT-NG backend, so this
little workaround in the meantime. Thanks for taking care of that!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
