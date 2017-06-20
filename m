From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Jun 2017 18:04:12 +0200
Subject: [Buildroot] CCACHE accross multiple buildroot projects
In-Reply-To: <CAEyMn7arQ1cEb6Yy2Gkc+FCMPJYbnpKdANQzXWQaCrKzePSfgw@mail.gmail.com>
References: <CAEyMn7arQ1cEb6Yy2Gkc+FCMPJYbnpKdANQzXWQaCrKzePSfgw@mail.gmail.com>
Message-ID: <20170620160412.GC2892@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2017-06-19 15:57 +0200, Heiko Thiery spake thusly:
> is it allowed to use CCACHE accross several projects (all the same
> architecture)?

Normally, ccache hashes a few things to ensure that it does not re-use
incompatible obkects. It should be safe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
