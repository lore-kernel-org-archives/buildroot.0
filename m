From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 28 Sep 2010 18:38:46 +0200
Subject: [Buildroot] [ Patch 0/4] Fix for POSIX compliance
In-Reply-To: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <201009281838.46148.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Monday 20 September 2010 23:26:05 Yann E. MORIN wrote:
> This series adds fixes for POSIX 1003.1-2008 compliance in some shell
> scripts, with respect to string comparison. POSIX says that string
> comparison in test(1) is done using a sing '='; using two is a bashism.

Ping? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
