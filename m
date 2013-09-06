From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Sep 2013 17:53:47 +0200
Subject: [Buildroot] [RFCv1 02/11] toolchain-crosstool-ng: remove support
In-Reply-To: <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130906155347.GF3271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-05 23:27 +0200, Thomas Petazzoni spake thusly:
> In order to avoid the work of converting the toolchain-crosstool-ng
> logic to the package infrastructure, we remove it from Buildroot,
> since it has been deprecated since quite some time.

BTW, you forgot to remove references to the crosstool-NG backend from
the manual while at it. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
