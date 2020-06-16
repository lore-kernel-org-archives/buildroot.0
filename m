From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Jun 2020 08:54:34 +0200
Subject: [Buildroot] [PATCH v3] package/eigen: use cmake-package infra
In-Reply-To: <CANQCQpamzLJeWXCWb_ZeT9S1K=XCdMZHO5ir=5Lqd7N4ZErorQ@mail.gmail.com>
References: <20200614173754.702855-1-juju@cotds.org>
 <20200615184911.71434-1-juju@cotds.org>
 <CANQCQpamzLJeWXCWb_ZeT9S1K=XCdMZHO5ir=5Lqd7N4ZErorQ@mail.gmail.com>
Message-ID: <20200616065434.GH2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2020-06-15 18:50 -0500, Matthew Weber spake thusly:
> On Mon, Jun 15, 2020 at 1:50 PM Julien Olivain <juju@cotds.org> wrote:
[--SNIP--]
> > -config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
> Do we need to add a legacy config for this?

As explained in the commit log, no. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
