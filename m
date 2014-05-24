From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 May 2014 19:32:05 +0200
Subject: [Buildroot] [PATCH 2 of 2 for-2014.05] website: remove
 remaining references to uclibc.org
In-Reply-To: <36e66c9b8a9f7a434c4b.1400951995@argentina>
References: <patchbomb.1400951993@argentina>
 <36e66c9b8a9f7a434c4b.1400951995@argentina>
Message-ID: <20140524173205.GA3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-24 19:19 +0200, Thomas De Schampheleire spake thusly:
> The website still used some uclibc.org URLs which can now use buildroot.org.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

With the minor not below fixed:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  docs/docs.html       |  2 +-
>  docs/js/buildroot.js |  2 +-
>  docs/support.html    |  2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Note: the news.html page still uses bugs.uclibc.org instead of
> bugs.buildroot.org, which I was hesitant to change ("you can't rewrite the
> past"). However, I would like to request Peter if upcoming release
> announcements could start using bugs.buildroot.org instead...
> 
> diff --git a/docs/docs.html b/docs/docs.html
> --- a/docs/docs.html
> +++ b/docs/docs.html
> @@ -34,7 +34,7 @@ help:</p>
>    <li>On the <a href="irc://freenode.net/#buildroot">Buildroot IRC
>    channel</a>, <code>#buildroot</code> on Freenode</li>
>  
> -  <li>On our <a href="https://bugs.uclibc.org">bugtracker</a>.</li>
> +  <li>On our <a href="https://bugs.buildroot.org">bugtracker</a>.</li>
>  
>    <li>Through the various companies offering commercial Buildroot
>    support.</li>
> diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
> --- a/docs/js/buildroot.js
> +++ b/docs/js/buildroot.js
> @@ -36,7 +36,7 @@ function load_activity(feedurl, divid) {
>  
>  function initialize() {
>    load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
> -  load_activity("http://git.uclibc.org/buildroot/atom/?h=master", "commit-activity");
> +  load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
>  }
>  
>  function google_analytics() {
> diff --git a/docs/support.html b/docs/support.html
> --- a/docs/support.html
> +++ b/docs/support.html
> @@ -37,7 +37,7 @@ list with frequently asked questions...
>  
>  <h3>Bug Tracker</h3>
>  
> -If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.uclibc.org/">Bug Tracker</a>
> +If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.buildroot.org/">Bug Tracker</a>
                               ^
While you are at it, this should be a singular.

Regards,
Yann E. MORIN.

>  to post your bugs and/or participate to find solutions to existing problems.
>  
>  Note: Patch are only accepted through the mailing list.
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
