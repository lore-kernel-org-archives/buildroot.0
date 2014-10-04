From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Oct 2014 19:26:54 +0200
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: rename
 _INSTALL_HOST_OPTS -> _INSTALL_OPTS
In-Reply-To: <20141004192136.0df6ae55@free-electrons.com>
References: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
 <20141004192136.0df6ae55@free-electrons.com>
Message-ID: <20141004172654.GF3990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-04 19:21 +0200, Thomas Petazzoni spake thusly:
> Dear Samuel Martin,
> 
> On Sat,  4 Oct 2014 19:19:02 +0200, Samuel Martin wrote:
> > This pacth renames, consistently with the other package infrastructures,
> > the _INSTALL_OPTS variable for host CMake-based package.
> > 
> > As mentioned in [1], no host-cmake-package uses this variable so far; so
> > it is a safe rename.
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html
> > 
> > Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  package/pkg-cmake.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> What about the manual?

That's what I thought at first, too. But there is no reason to document
it, as it is already covered in generic package infra:

    * HOST_LIBFOO_INSTALL_CMDS lists the actions to be performed to
    install the package, when the package is a host package. [...]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
