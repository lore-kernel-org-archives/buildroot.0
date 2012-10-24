From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Oct 2012 00:27:15 +0200
Subject: [Buildroot] [PATCH] keyutils: new package
In-Reply-To: <201210242306.38368.yann.morin.1998@free.fr>
References: <1351112292-5617-1-git-send-email-jarkko.sakkinen@iki.fi>
 <201210242306.38368.yann.morin.1998@free.fr>
Message-ID: <201210250027.15661.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jarkko, All,

On Wednesday 24 October 2012 Yann E. MORIN wrote:
> On Wednesday 24 October 2012 Jarkko Sakkinen wrote:
> > Linux key management utilities
> 
> There are two memleaks known in keyutils.
> 
> I'm about to post a patch series that includes keyutils
> with patches to fix the memleaks.

Also, the install rule needs to be fixed. See:
  http://lists.busybox.net/pipermail/buildroot/2012-October/060377.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
