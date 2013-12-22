From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 18:30:15 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 03/10] lua: remove a too
 invasive patch
In-Reply-To: <20131222182451.34bdf2c3@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-3-git-send-email-francois.perrad@gadz.org>
 <20131222182451.34bdf2c3@skate>
Message-ID: <20131222173015.GA3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-12-22 18:24 +0100, Thomas Petazzoni spake thusly:
> On Fri, 15 Nov 2013 14:07:32 +0100, Francois Perrad wrote:
> > the static version of luac is enough
> > 
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/lua/lua-03-shared-libs-for-luac.patch |   97 -------------------------
> >  1 file changed, 97 deletions(-)
> >  delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> Peter, can you apply this patch right now? It is independent from the
> rest of the series, and would allow to reduce the size of the series.

Yes, please! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
