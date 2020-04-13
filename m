From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Apr 2020 07:24:38 -0500
Subject: [Buildroot] [PATCH] package/dnsmasq: bump to version 2.81
In-Reply-To: <8fbf8d459631d9297e0959bd171514834d457fd3.1586751864.git.baruch@tkos.co.il>
References: <8fbf8d459631d9297e0959bd171514834d457fd3.1586751864.git.baruch@tkos.co.il>
Message-ID: <CANQCQpYbOmrvvJc6S2Ki-oFLL4+RMLpprGYt4opcDs=bMzyT7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,


On Sun, Apr 12, 2020 at 11:26 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Drop upstream patches.
>
> Remove CVE annotation; issue fixed upstream.
>
> Depend on MMU. Upstream removed support for fork-less targets (commit
> 48d12f14c9c).

Agree

>
> Reformat hashes file with two spaces delimiter. Remove stale 2.79
> tarball hash entry.
>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

I double checked the drops are included in the release

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>  delete mode 100644 package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch

http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=240da59f73cc3ba46a343b710c826eb8c322b4d4

>  delete mode 100644 package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch

http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=ab73a746a0d6fcac2e682c5548eeb87fb9c9c82e

>  delete mode 100644 package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch

http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb

>  delete mode 100644 package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
>

http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=69bc94779c2f035a9fffdb5327a54c3aeca73ed5

>  DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
>  DNSMASQ_LICENSE_FILES = COPYING COPYING-v3

I double checked these license file content didn't change.

Best Regards.
-Matt
