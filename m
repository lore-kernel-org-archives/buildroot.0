From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2015 00:07:12 +0100
Subject: [Buildroot] [PATCH 09/13 v2] core/legal-info: also save patches
In-Reply-To: <5672925A.5080400@lucaceresoli.net>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <a0a187ba70eeb0c27ae84cbc52d823d3ca445a83.1450031251.git.yann.morin.1998@free.fr>
 <5672925A.5080400@lucaceresoli.net>
Message-ID: <20151218230712.GD10982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2015-12-17 11:45 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >Currently, the legal-info infra only saves the source archive of a
> >package. However, that's not enough as we may apply some patches on
> >packages sources.
[--SNIP--]
> >diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> >index d07c45d..4d7fd7c 100644
> >--- a/support/legal-info/README.header
> >+++ b/support/legal-info/README.header
> >@@ -16,8 +16,7 @@ This material is composed of the following items.
> >     need to collect it manually.
> >   * The source code for all packages; this has been saved in the sources/
> >     subdirectory (except for the non-redistributable packages, which have not
> >-   been saved); patches applied to some packages by Buildroot are included in
> >-   the Buildroot sources and were not duplicated in the sources/ subdirectory.
> >+   been saved).
> 
> Now we could explicitly state we also save patches. E.g. changing the
> above bullet to:
> 
>  * The original source code for all packages; this has been saved in...
>        ^^^^^^^^
> 
> And adding:
> 
>  * The patches applied to the source code before building it, along with
>    a file named 'series' that lists the same patches in the order they
>    have been applied.

I've used sa slightly different wording:

 * The source code for all packages; this has been saved in the sources/
   subdirectory (except for the non-redistributable packages, which have not
   been saved). Patches that were applied are also saved, along with a file
   named 'series' that lists the patches in the order they were applied.

> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Do they still stand with the above wording?

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
