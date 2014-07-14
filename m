From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 14:30:48 +0200
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714130104.480ab4cf@free-electrons.com>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com>
Message-ID: <20140714123048.GB3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gustavo, All,

On 2014-07-14 13:01 +0200, Thomas Petazzoni spake thusly:
> On Sat, 12 Jul 2014 14:27:03 -0300, Gustavo Zacarias wrote:
> > It adds some extra build time when doing autoreconf passes but the alternative
> > would require a new GETTEXTIZE option and package audit which could take some
> > time to get resolved.
> 
> I believe I would actually prefer a separate GETTEXTIZE option, I'm a
> little bit worried about the extra build time. What do others think?

Should I revive the series I did a while ago, that did just that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
