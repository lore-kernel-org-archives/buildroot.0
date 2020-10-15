From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Thu, 15 Oct 2020 12:30:20 +0000
Subject: [Buildroot] [PATCH 1/1] opensc: new package
In-Reply-To: <HTWQnJ0gT9IYyrHRALoef3ZjeiElmsAU9i55-sqSxBQ5ZyngPz7qhxmskaI-ATuoiCd2BDsDq1CTS01wtL_ZGkCyR3RcGrXRaNbYiFE-sbw=@protonmail.com>
References: <HTWQnJ0gT9IYyrHRALoef3ZjeiElmsAU9i55-sqSxBQ5ZyngPz7qhxmskaI-ATuoiCd2BDsDq1CTS01wtL_ZGkCyR3RcGrXRaNbYiFE-sbw=@protonmail.com>
Message-ID: <fZaQbgLpeJHJz6iuvKKhwE9v__WcF-9kPa-pTbloqWG29zwB9vPg4gOJQVj9qvTBBH9oARRQVBtIZEpEzDNYXVny4F1if3nuEpH9z1cnJv4=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignore, need to add package/ to subject line and probably wchar and/or iconv


Yair

??????? Original Message ???????
On Thursday, October 15, 2020 2:23 PM, Yair Ben-Avraham <yairba@protonmail.com> wrote:

> Open source smart card tools and middleware.
> OpenSC provides a set of libraries and utilities to work with smart cards. Its
> main focus is on cards that support cryptographic operations, and facilitate
> their use in security applications such as authentication, mail encryption and
> digital signatures. OpenSC implements the standard APIs to smart cards, e.g.
> PKCS#11 API, Windows? Smart Card Minidriver and macOS CryptoTokenKit.
>
> Signed-off-by: Yair Ben-Avraham yairba at protonmail.com
>
> ...icit-declaration-of-function-wprintf.patch | 26 +++++++++++++++++++
> package/opensc/Config.in | 22 ++++++++++++++++
> package/opensc/opensc.hash | 3 +++
> package/opensc/opensc.mk | 14 ++++++++++
> 4 files changed, 65 insertions(+)
> create mode 100644 package/opensc/0001-Comment-implicit-declaration-of-function-wprintf.patch
> create mode 100644 package/opensc/Config.in
> create mode 100644 package/opensc/opensc.hash
> create mode 100644 package/opensc/opensc.mk

[snip...]
