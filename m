From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 20:15:37 +0200
Subject: [Buildroot] [PATCH] systemd: bump to version 221
In-Reply-To: <1435583683-6642-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435583683-6642-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150630181537.GE3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-06-29 15:14 +0200, Vicente Olivert Riera spake thusly:
> - Bump to version 221

This causes build falures because the licensing information is not
correct:

    http://autobuild.buildroot.org/results/6e3/6e3dace5892a589225a93c896917833ebc8028f3/build-end.log

Care to send a fix, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
