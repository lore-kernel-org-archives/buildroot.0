From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Sep 2016 23:14:50 +0200
Subject: [Buildroot] [PATCH v3 0/4] Add a get-developers script and
 database
In-Reply-To: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160912211450.GB15314@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-12 22:54 +0200, Thomas Petazzoni spake thusly:
> This is the third version of the patch series adding a get-developers
> script and the corresponding DEVELOPERS database.

All I want to say is, just commit that already! ;-)

Seriously, this thing is working: we've been receiving notifications for
some time now.

It will not be easy for you to maintain the developpers file locally, so
if we want people to register as developpers, we need to have that in
the tree.

Any remaining nit can be fixed afterward.

Regards,
Yann E. MORIN.

> Since v2, the DEVELOPERS database has seen numerous updates, following
> the feedback from several Buildroot developers.
> 
> Thanks,
> 
> Thomas
> 
> Thomas Petazzoni (4):
>   support/scripts/get-developers: add new script
>   DEVELOPERS: add initial list of Buildroot developers
>   docs/manual: update contribute.txt to cover get-developers
>   docs/manual: add new section about the DEVELOPERS file and
>     get-developer
> 
>  DEVELOPERS                         | 1581 ++++++++++++++++++++++++++++++++++++
>  docs/manual/contribute.txt         |   18 +-
>  docs/manual/developers.txt         |   46 ++
>  docs/manual/manual.txt             |    2 +
>  support/scripts/get-developers     |   83 ++
>  support/scripts/getdeveloperlib.py |  201 +++++
>  6 files changed, 1929 insertions(+), 2 deletions(-)
>  create mode 100644 DEVELOPERS
>  create mode 100644 docs/manual/developers.txt
>  create mode 100755 support/scripts/get-developers
>  create mode 100644 support/scripts/getdeveloperlib.py
> 
> -- 
> 2.7.4
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
