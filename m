From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 28 May 2010 18:24:09 +0200
Subject: [Buildroot] git access via http
In-Reply-To: <87typstjkx.fsf@macbook.be.48ers.dk>
References: <AB12B32E73474741A2C5361C433A44DE01CD4EEB@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<87typstjkx.fsf@macbook.be.48ers.dk>
Message-ID: <201005281824.09647.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Phil, All,

On Friday 28 May 2010 12:19:10 Peter Korsgaard wrote:
> Hmm, seems like git-over-http was never set up by the osuosl.org
> people. Is this important for you? The native git protocol is a lot
> better.

Yes, but in some companies, the policy is to acces the "internet" only
through http/https proxies. Some even disallow the 'CONNECT' command to
anything else but http/https/ftp, and do not offer socks proxies. These
rule out anything but plain http/ftp.

So, having buildroot's git available through http would be nice, IMHO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
