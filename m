From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Fri, 26 Sep 2014 13:58:25 +0200
Subject: [Buildroot] [PATCH 0/3] Add ICAP server support
In-Reply-To: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <542554E1.9020201@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping.

Guillaume


Le 18/09/2014 11:27, Guillaume GARDET a ?crit :
> Hi,
>
> This patch series enable ICAP support in squid and add c-icap and c-icap-modules packages.
>
> Regards,
>
> Guillaume
>
> ----------------------------------------------------------------
> Guillaume GARDET (3):
>    Enable c-icap server support in squid and define logdir, pidfile and
>        swapdir
>    New package: c-icap     c-icap is an implementation of an ICAP server.
>      Squid 3.x proxy server     supports it.
>    New package: c-icap-modules     Additionals modules for c-icap server.
>
>   package/Config.in                        |  2 ++
>   package/c-icap-modules/Config.in         |  7 +++++++
>   package/c-icap-modules/c-icap-modules.mk | 27 +++++++++++++++++++++++++++
>   package/c-icap/Config.in                 | 10 ++++++++++
>   package/c-icap/c-icap.mk                 | 24 ++++++++++++++++++++++++
>   package/squid/squid.mk                   | 12 ++++++++++--
>   6 files changed, 80 insertions(+), 2 deletions(-)
>   create mode 100644 package/c-icap-modules/Config.in
>   create mode 100644 package/c-icap-modules/c-icap-modules.mk
>   create mode 100644 package/c-icap/Config.in
>   create mode 100644 package/c-icap/c-icap.mk
>
