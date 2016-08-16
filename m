From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Aug 2016 21:42:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <20160816142950.GH3368@tarshish>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
 <20160816035044.GB3368@tarshish>
 <9ba51c53-ddb3-8a59-a3b0-9ba8e3e52f3e@gmail.com>
 <20160816142950.GH3368@tarshish>
Message-ID: <20160816194236.GC10734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-08-16 17:29 +0300, Baruch Siach spake thusly:
> As Yann marked this patch as rejected, this discussion is moot. But I'll 
> respond below for future reference.
> 
> On Tue, Aug 16, 2016 at 10:31:10AM +0200, Lothar Felten wrote:
> > On 16.08.2016 05:50, Baruch Siach wrote:
> > > Looking into a random source file like sim_imd.c, the license seems to be 
> > > MIT. See https://opensource.org/licenses/MIT.
> > 
> > Most files have a MIT-license/disclaimer, a few files reference GNU GPL
> > (Intel-Systems/common/i8088.c), at least one file is paritally zlib/libpng
> > license (sim_video.c, line 102), one file is "licensed under the standard
> > SimH license" (PDP11/pdp11_kmc.c), which seems to be MIT.
> 
> In this case <PKG>_LICENSE should list all these licenses.

Yes.

> > There's a Word .doc file doc/simh.doc that states:
> > 
> > COPYRIGHT NOTICE: The following copyright notice applies to the SIMH source,
> > binary, and documentation (an then: MIT license)
> > 
> > An older PDF version is online:
> > http://simh.trailing-edge.com/pdf/simh_doc.pdf
> > 
> > Should I point to the simh.doc file?
> 
> I don't think so. Not sure how our legal info infra handles binary document 
> formats.

FOO_LICENSE_FILES are just copied; we don't do anything with them. So
it's fine to list a .doc in there.

> Instead you may put source files that contain respective licenses 
> text in <PKG>_LICENSE_FILES.

Only for those licenses that do not have a separate license file, or are
not listed in that .doc file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
