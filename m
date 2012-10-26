From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Oct 2012 22:39:30 +0200
Subject: [Buildroot] [PATCH 01/47] package/cURL: fix static link
	whithopenSSL
In-Reply-To: <7D104BEF3E404707964408D74CCF1F01@JohanW7>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <201210261925.14598.yann.morin.1998@free.fr>
 <7D104BEF3E404707964408D74CCF1F01@JohanW7>
Message-ID: <201210262239.30917.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

[Please keep the list in CC, don't reply only to me]

On Friday 26 October 2012 Sagaert Johan wrote:
> Is this fixing the problem I had 6 months ago where the curl binary just
> said :segmentation fault when it was build with openssl support ?

No idea; probably not. This fixes a build-time issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
