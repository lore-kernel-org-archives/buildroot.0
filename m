From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2018 17:41:02 +0100
Subject: [Buildroot] [PATCH] package/netsnmp: drop our custom config
 script fixups
In-Reply-To: <87k1kv7t04.fsf@dell.be.48ers.dk>
References: <20181128204423.13058-1-yann.morin.1998@free.fr>
 <87k1kv7t04.fsf@dell.be.48ers.dk>
Message-ID: <20181129164102.GB18074@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

\Peter, All,

On 2018-11-29 17:23 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Fixes:
>  >     http://autobuild.buildroot.org/results/2c5/2c5e379a06825bf8588bf070d733d2e1f98dab66/
>  >     http://autobuild.buildroot.org/results/eea/eea704463c3f14dbb9bd7f8aa23d4b61c25987f4/
> These are both on next, so I assume this is meant for next?
> Committed to next, thanks.

Yes, the patch was meant for next, thanks.

In theory, it should also apply to master, for the reasons explained in
the commit log. However, we don't have the rror on master, because we do
not have the triggerring change due to PPD preparation patches.

So, to be safe, don't apply on master.

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
