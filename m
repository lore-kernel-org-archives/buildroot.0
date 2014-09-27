From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 14:37:26 +0200
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
 package
In-Reply-To: <20140927122848.GA1752@fox>
References: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
 <20140927085443.GA4298@free.fr> <20140927122848.GA1752@fox>
Message-ID: <20140927123726.GB4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2014-09-27 09:28 -0300, Guido Mart?nez spake thusly:
> On Sat, Sep 27, 2014 at 10:54:44AM +0200, Yann E. MORIN wrote:
> > Guido, All,
> > 
> > What is the rationale for building it as a host-package?
> >
> > libarchive provides a library, but we have no in-tree host-package that
> > uses libarchive.
> I have a custom tool that uses it, and I wasn't aware that host packages
> were only enabled as needed. It makes a lot sense now that I think about
> that, so please ignore this patch.

For the records, repeating here what I said on IRC:

I never said we do not want it, just that you have to justify it. We
tend to be conservative about adding host-packages, and only add
programs, and libraries those programs need. Adding a host library that
has no in-tree user should thus be realy justified.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
