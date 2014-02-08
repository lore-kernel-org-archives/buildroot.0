From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2014 13:49:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-07
In-Reply-To: <20140208073009.5C3E6100CDC@stock.ovh.net>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>
Message-ID: <20140208124907.GA3442@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-08 08:30 +0100, Thomas Petazzoni spake thusly:
> Build statistics for 2014-02-07
>        arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/310e355f2f601801e4500b9d3e714d3883e7aa32/
>        arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/90e1a2e3e428e6c3fe5b51668ab92c139f176260/

Too old toolchain:
  - SYS_TURBO was introduced in linux 3.2
  - SYS_DVBC_ANNEX_A in linux 3.2
  - SYS_DVBC_ANNEX_C and DTV_ENUM_DELSYS in linux 3.3

>    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/549564293607c959fa09e12510bb2aaa79f4f479/

Too old toolchain, as usual.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
