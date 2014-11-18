From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 18 Nov 2014 14:02:25 -0300
Subject: [Buildroot] [PATCH v3 3/5] pkg-generic.mk: don't depend on
 external package permissions
In-Reply-To: <20141117214106.GG12473@free.fr>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-4-git-send-email-guido@vanguardiasur.com.ar>
 <20141117214106.GG12473@free.fr>
Message-ID: <20141118170225.GB20682@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 17, 2014 at 10:41:06PM +0100, Yann E. MORIN wrote:
> Guido, All,
> 
> On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
> > Reset permissions for rsynced packages (when using OVERRIDE_SRCDIR) to
> > 755/644. We do this under the assumption that source files shouldn't
> > care about their permissions, except for possibly the exec bit.
> 
> Nit-picking:  except possibly for...
Oops :)! Fixed

Thanks!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
