From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Sep 2016 23:20:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] buildroot-test: failure reason regex
 update
In-Reply-To: <20160906220459.4ed92fe7@free-electrons.com>
References: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
 <1459468972-31420-2-git-send-email-matt@thewebers.ws>
 <20160906220459.4ed92fe7@free-electrons.com>
Message-ID: <20160906212004.GD12105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Matt,

On 2016-09-06 22:04 +0200, Thomas Petazzoni spake thusly:
> On Thu, 31 Mar 2016 19:02:52 -0500, Matt Weber wrote:
> > - Sub-make required one additional line tailed
> > - Both autobuild-run  regex to truncate end log
> >   and import which sets the failure reason on
> >   the report are updated
> > 
> > Signed-off-by: Matt Weber <matt@thewebers.ws>
> > 
> > --
> > Changes for v2:
> > - Added back in : as previous test masked
> >   that is was ok to leave in (Suggested by Thomas)
> > ---
> >  scripts/autobuild-run | 4 ++--
> >  web/import.inc.php    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Applied to buildroot-test, and deployed on autobuild.b.o. Of course,
> it's up to the people using autobuild-run to update it on their side.

Done! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
