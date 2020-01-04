From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:19:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.9.2
In-Reply-To: <20200104140824.2338592-1-bernd.kuhls@t-online.de>
References: <20200104140824.2338592-1-bernd.kuhls@t-online.de>
Message-ID: <20200104161926.4f7b1e45@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 15:08:23 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://dovecot.org/pipermail/dovecot-news/2019-October/000419.html
> https://dovecot.org/pipermail/dovecot-news/2019-December/000423.html
> https://dovecot.org/pipermail/dovecot-news/2019-December/000425.html
> https://dovecot.org/pipermail/dovecot-news/2019-December/000427.html
> 
> Please note that according to
> https://security-tracker.debian.org/tracker/CVE-2019-19722
> CVE-2019-19722 fixes a bug introduced in 2.3.9 so backporting this patch
> to older buildroot branches is not necessary.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-Do-not-build-static-test-iostream-s.patch | 30 +++++++++++++++++++
>  package/dovecot/dovecot.hash                  |  2 +-
>  package/dovecot/dovecot.mk                    |  6 +++-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
