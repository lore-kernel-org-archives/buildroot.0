From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 17:32:50 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version
 to 42ec119
In-Reply-To: <20200114152755.4123935c@gmx.net>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-3-ps.report@gmx.net>
 <trinity-41871925-7822-4238-98ae-909b71ee05a8-1579005943320@3c-app-mailcom-bs09>
 <20200114152755.4123935c@gmx.net>
Message-ID: <20200114163250.GD22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-01-14 15:27 +0100, Peter Seiderer spake thusly:
> On Tue, 14 Jan 2020 13:45:43 +0100, daggs <daggs@gmx.com> wrote:
> > do note that this commit allows rpi-userland compilation on aarch64. might be a good idea to fix rpi-userland.mk and Config.in to support that.
> Thanks for the hint, will give it a try the next days....

Thanks. If at all possible, enable aarch64 in a separate patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
