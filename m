From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 11:07:11 +0200
Subject: [Buildroot] [PATCH v5 2/2] i2c-tools: add support to build
 python extension
In-Reply-To: <20150406110341.629b5df3@free-electrons.com>
References: <1428272105-27627-1-git-send-email-ryanbarnett3@gmail.com>
 <1428272105-27627-2-git-send-email-ryanbarnett3@gmail.com>
 <20150406110341.629b5df3@free-electrons.com>
Message-ID: <20150406090711.GB4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-06 11:03 +0200, Thomas Petazzoni spake thusly:
> On Sun,  5 Apr 2015 17:15:05 -0500, Ryan Barnett wrote:
> > Add a config option to build the python bindings for i2c-tools -
> > py-smbus. The steps for building the python bindings is the same as
> > the distutil steps that are a part of the python infrastructure.
> > 
> > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> > CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > CC: Baruch Siach <baruch@tkos.co.il>
> > CC: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Applied. Did you check that i2c-tools python support was Python 2 only?
> Or does it also support Python 3 ?

Yes, it is Python-2 only (see the v1->v2 changelog in the commit notes).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
