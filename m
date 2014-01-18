From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 20:56:47 +0100
Subject: [Buildroot] [PATCH 07/10] connman: add systemd unit file
In-Reply-To: <1390073027-14239-8-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20140118195647.GD23411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
> This patch cleans up the init material installation:
> - it uses the *_INSTALL_INIT_SYSV infra instead of the custom hook;
> - it add and install the systemd unit file

Please split this patch in two, then. One to switch to using the
_INSTALL_INIT_SYSV infra, the second to actually add the systemd unit.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
