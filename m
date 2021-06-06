From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 09:20:12 +0200
Subject: [Buildroot] [PATCH] scipts/autobuild-run: properly import
 urllib2.URLError
In-Reply-To: <20210605230548.5daa732c@windsurf>
References: <20210605210016.1157351-1-yann.morin.1998@free.fr>
 <20210605230548.5daa732c@windsurf>
Message-ID: <20210606072012.GC168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2021-06-05 23:05 +0200, Thomas Petazzoni spake thusly:
> On Sat,  5 Jun 2021 23:00:16 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Commit 37766e9 (scripts/autobuild-run: add a retry loop to not fail on
> > urllib URLError) introduced an import of URLError, but that raises
> > exceptions in both python2 and python3:
[--SNIP--]
> > The working solution is to import from:
[--SNIP--]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master (on buildroot-test), thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
