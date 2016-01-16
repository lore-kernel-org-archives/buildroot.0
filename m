From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:49:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2016.01
In-Reply-To: <569ABB4F.3050905@mind.be>
References: <1452980355-20322-1-git-send-email-joerg.krause@embedded.rocks>
 <569ABB4F.3050905@mind.be>
Message-ID: <20160116224907.GA11783@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-16 22:51 +0100, Arnout Vandecappelle spake thusly:
> On 16-01-16 22:39, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
>  Maybe add
> 
> Fixes
> http://autobuild.buildroot.net/results/9ebc5e3a6f1dd3ceb90d6786a1c5455c965f819e
> 
> 
> > ---
> >  package/uboot-tools/uboot-tools.hash | 2 +-
> >  package/uboot-tools/uboot-tools.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
> > index 65a5261..31b0db9 100644
> > --- a/package/uboot-tools/uboot-tools.hash
> > +++ b/package/uboot-tools/uboot-tools.hash
> > @@ -1,2 +1,2 @@
> >  # Locally computed:
> > -sha256	bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
> > +sha256  e5792fba9399d9804aa2ef667f14ff771e2cdece72367d340250265bf095a5d5  u-boot-2016.01.tar.bz2
> 
>  Don't we normally separate with tabs?

Well, when I added support for hashes, I intended it to be used with
spaces, a bit like the output of the corresponding *sum utilities, so
that it could be esaily copy-pasted to create a .hash file.

Also, the manual states:

    The format of this file is one line for each file for which to check
    the hash, each line being space-separated, with these three fields:
    [...]
    The number of spaces does not matter, so one can use spaces (or
    tabs) to properly align the different fields.

So, to me, TABs are accepted, but spaces should be the norm.

At least, I despise TABs... ;-] They are whatever the user wants them
to be, and thus break any alignment that was done by the author of the
code. I believe TABs should be proscribed everywhere it's possible
(Makefiles being the outstanding offenders^Wexception...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
