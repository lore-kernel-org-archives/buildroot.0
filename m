From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2015 01:06:06 +0100
Subject: [Buildroot] [PATCH 3/3] support/download: always fail when
 there's no hash
In-Reply-To: <550A071B.7000000@mind.be>
References: <cover.1426545571.git.yann.morin.1998@free.fr>
 <e443dfcec4c084f823c718aa4c7740eddb3b628e.1426545571.git.yann.morin.1998@free.fr>
 <550A071B.7000000@mind.be>
Message-ID: <20150319000606.GE4578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-03-19 00:15 +0100, Arnout Vandecappelle spake thusly:
> On 16/03/15 23:41, Yann E. MORIN wrote:
> > At the time we introduced hashes, we did not want to be too harsh in the
> > beginning, and give people some time to adapt and accept to hashes. So
> > we so far only whined^Wwarned about a missing hash file.
> > 
> > Some time has passed now, and people are still missing updating hashes
> > when bumping packages.
> > 
> > Let's make that warning a little bit more annoying...
> 
>  If you ever revive this series (which I think would be a good idea), don't
> forget to remove the reference to BR2_ENFORCE_CHECK_HASH from the manual as well.

Already done in v2:
    http://patchwork.ozlabs.org/patch/450979/

;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
