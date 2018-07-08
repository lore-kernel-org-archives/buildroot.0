From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 14:35:29 +0200
Subject: [Buildroot] [PATCH 49/50 v2] package/busybox: add dependency on
 attr
In-Reply-To: <966699f8-8101-4a99-ba1c-a3b6a7eb5806@mind.be>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <5b94111a961b4f18589aa5b5dbc71fc71289e448.1531043163.git.yann.morin.1998@free.fr>
 <966699f8-8101-4a99-ba1c-a3b6a7eb5806@mind.be>
Message-ID: <20180708123529.GF2474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-07-08 13:09 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-18 11:46, Yann E. MORIN wrote:
> > attr and busybox may each install setfattr, so attr must be installed
> > before busybox.
>  bzip2 is in a similar situation, and probably more.

Sure, but I took care only of attr because we had a bug about it, not
for the others.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
