From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 May 2014 22:05:32 +0200
Subject: [Buildroot] [PATCH for 2014.05] manual: explicitize manual
 license
In-Reply-To: <a74f7fbcfd8f324f830e.1401219253@argentina>
References: <a74f7fbcfd8f324f830e.1401219253@argentina>
Message-ID: <20140527200532.GA27233@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-27 21:34 +0200, Thomas De Schampheleire spake thusly:
> People reading the Buildroot manual online cannot immediately know what its
> license is (unlike reading it from within the source tree). To avoid any
> discussion, explicitize this in the manual.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/manual.txt |  5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -7,6 +7,11 @@
>  Buildroot usage and documentation by Thomas Petazzoni. Contributions
>  from Karsten Kruse, Ned Ludd, Martin Herren and others.
>  
> +The Buildroot manual is licensed under the GNU General Public License,
> +version 2. Refer to file
> +http://git.buildroot.org/buildroot/tree/COPYING[COPYING] in the Buildroot
> +sources for the full text of this license.
> +
>  Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
>  {localtime} from git revision {sys:git rev-parse --short HEAD}
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
