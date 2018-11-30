From: Ryan Barnett <Ryan.Barnett@collins.com>
Date: Fri, 30 Nov 2018 11:23:27 -0600
Subject: [Buildroot] [next v2 1/1] package/proftpd: add mod_sql_sqlite
In-Reply-To: <20181128141402.11502-1-jared.bents@rockwellcollins.com>
References: <20181128141402.11502-1-jared.bents@rockwellcollins.com>
Message-ID: <CAMQcK5KwmS6psbzDqrQmaz=2Cq-Kx7qyPotCzCqAXZ7rJtUv9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 28, 2018 at 8:14 AM Jared Bents <Jared.Bents@collins.com> wrote:
>
> Enable mod_sql_sqlite as a compile time option
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> [v1->v2]: Update for sqlite dependency
> ---
[...]
> +if BR2_PACKAGE_PROFTPD_MOD_SQL
> +
> +config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
> +       bool "mod_sql_sqlite support"
> +       select BR2_PACKAGE_SQLITE
> +       help
> +         Compile ProFTPD with mode_sql_sqlite support.

Minor typo: mode -> mod

> +
> +endif
> +

[...]

Reviewed-by: Ryan Barnett <ryan.barnett@collins.com>

---
Ryan Barnett | Sr Systems Engineer | Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com
