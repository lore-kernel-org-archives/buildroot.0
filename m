From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 May 2014 18:37:51 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: Remove ldconfig calls
In-Reply-To: <5379A235.2050101@mind.be>
References: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
 <5379A235.2050101@mind.be>
Message-ID: <20140519163751.GA3508@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-05-19 08:18 +0200, Arnout Vandecappelle spake thusly:
> On 13/05/14 22:35, Bernd Kuhls wrote:
> > ldconfig breaks links created by gpu-viv-bin-mx6q.
> 
>  As far as I can tell, there is never any reason to call ldconfig during the
> build. So, maybe a more fundamental solution would be to symlink
> $(HOST_DIR)/usr/bin/ldconfig to /bin/true...

Exactly what I was thinking...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
