From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Aug 2018 00:06:03 +0200
Subject: [Buildroot] [PATCH v3 1/2] i2c-tools: include LGPL-2.1+ license
 for libi2c
In-Reply-To: <20180824235759.4edac1f1@windsurf>
References: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
 <1535118847-21086-2-git-send-email-brad@nextdimension.cc>
 <20180824235759.4edac1f1@windsurf>
Message-ID: <20180824220603.GY9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-24 23:57 +0200, Thomas Petazzoni spake thusly:
> On Fri, 24 Aug 2018 08:54:06 -0500, Brad Love wrote:
> > Extend i2c-tools SPDX identifiers to include the library license.
> > Also include COPYING.LGPL and README to license files.
> > 
> > The ic2-tools readme states:
> > 
> > LICENSE
> > 
> > Check the documentation of individual tools for licensing information.
> > The library is released under the LGPL version 2.1 or later, while most
> > tools are released under the GPL version 2 or later, but there are a few
> > exceptions.
> > 
> > Signed-off-by: Brad Love <brad@nextdimension.cc>
> 
> I've applied to master, but after adding the hashes of the additional
> license files to i2c-tools.hash.
> 
> Yann: is it expected than missing hashes for license files is not a
> hard failure, when a hash file is present ? Perhaps it was back in the
> days, but maybe we should tighten up this ?

Definitely, we should make it a hard error, yes.

> Or at least in the case where one of the license files has a hash that
> is present, which was the case here.

If the .hash file is present, then all files must have a corresponding
hash in there. That's the rule for downloaded files; it should also be
the rule for license files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
