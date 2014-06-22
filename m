From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 00:37:24 +0200
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <53A75985.4040604@zacarias.com.ar>
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622172319.GA21768@free.fr> <53A75985.4040604@zacarias.com.ar>
Message-ID: <20140622223724.GE21768@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-22 19:32 -0300, Gustavo Zacarias spake thusly:
> On 06/22/2014 02:23 PM, Yann E. MORIN wrote:
> 
> > Any reason why you name the user and group with a leading '_' ?
> 
> Because the code says so, and it's not configurable.
> The group just to keep consistency.

Ok, that should be noted as a comment above the user definition, I
guess.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
