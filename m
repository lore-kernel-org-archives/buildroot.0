From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Aug 2017 19:51:53 +0200
Subject: [Buildroot] [PATCH v5 00/14] system: properly handle systemd as
	init system
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170802175153.GA2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-08-02 00:52 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This series is a proposal to fix our handling of systemd as an init
> system.
[--SNIP--]
> Changes v4 -> v5:
>   - moved the test infra patch all the way to the beginning of the series
>   - dropped the patch that removed support for BR2_INIT_NONE with the default
>     skeleton
>   - to make that possible, merged the patch that re-introduced BR2_INIT_NONE
>     support with the patch that breaks it, i.e. the introduction of
>     skeleton-sysv and skeleton-systemd
>   - split the patch that splits off skeleton-custom into 4 patches; the first
>     one does only the split, the other ones do 3 clean-ups. Except for
>     comments, the end result is the same as the original skeleton-custom
>   - add a further cleanup to skeleton-common that renames
>     SKELETON_ROOT_PASSWORD to SKELETON_CUSTOM_ROOT_PASSWORD
>   - re-generate .gitlab-ci.yml in the two patches that create new tests.

Thanks for cleaning it up faster than I could! ;-)

I'll try to dedicate a bit of time tonight to look at the patches that
are not yet applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
