From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Mar 2016 21:27:11 +0100
Subject: [Buildroot] [PATCH 2/8] core/pkg-utils: add a macro to
 pretty-print a help entry
In-Reply-To: <12788059.xfbTEnnL3q@sagittea>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <3c47341f237bad2ed0c674c2ffe1def03a2bdb64.1457561521.git.yann.morin.1998@free.fr>
 <56E0B3AD.2040104@mind.be> <12788059.xfbTEnnL3q@sagittea>
Message-ID: <20160310202711.GD3424@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2016-03-10 10:31 +0100, J?r?me Pouiller spake thusly:
> Hello Arnout, Yann,
> 
> On Thursday 10 March 2016 00:37:17 Arnout Vandecappelle wrote:
> > On 03/09/16 23:22, Yann E. MORIN wrote:
> [...]
> 
> > > +	for h in $(1); do \
> > > +		printf "  %-22s - %s\n" "$${h%% : *}" "$${h#* : }"; \
> > > +	done
> Personally, I dislike this automatic splitting of argument. Especially,
> this macro is not obvious and it may look like black magic.

Hmmm... Standard shell expansions that have been documented in POSIX
for, like, forever... And really, if you find this to be black magic,
I'm not sure what to say...

http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
