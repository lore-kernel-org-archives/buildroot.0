From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Dec 2019 23:09:21 +0100
Subject: [Buildroot] [PATCH/next v2 1/1] package/grpc: bump to version
 1.25.0
In-Reply-To: <20191203215631.GA20811@scaer>
References: <20191128231803.1351294-1-aduskett@gmail.com>
 <20191203215631.GA20811@scaer>
Message-ID: <20191203220921.GB20811@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2019-12-03 22:56 +0100, Yann E. MORIN spake thusly:
> On 2019-11-28 15:18 -0800, aduskett at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
[--SNIP--]
> > -GRPC_VERSION = 1.23.0
> > +GRPC_VERSION = 1.25.0
> I've spawned a few tests to see if that bump could fix all the failures
> I encounter on my autobuilder. I'll report back later.

Alas, to not avail. The build is still broken on my autobuilder... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
