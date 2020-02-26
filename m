From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:46:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/{avro-c,
 python-avro}: bump to version 1.9.2
In-Reply-To: <20200217142307.53693-1-titouan.christophe@railnova.eu>
References: <20200217142307.53693-1-titouan.christophe@railnova.eu>
Message-ID: <20200226224647.0ea3a65f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 15:23:07 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

>  - Drop patch for avro-c that was applied upstream
>  - Fix inconsistency in PYTHON_AVRO_SITE
>  - Adopt new spacing convention in .hash files
>  - Add upstream patch for python-avro
>  - Add patch to remove installation-time linting in python-avro
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  ...-C-to-be-built-on-musl-based-systems.patch | 45 ------------------
>  package/avro-c/avro-c.hash                    |  6 +--
>  package/avro-c/avro-c.mk                      |  2 +-
>  .../0001-fix-pycodestyle-regression.patch     | 28 +++++++++++
>  ...all-time-linting-and-imports-sorting.patch | 46 +++++++++++++++++++
>  package/python-avro/python-avro.hash          |  6 +--
>  package/python-avro/python-avro.mk            |  2 +-
>  7 files changed, 82 insertions(+), 53 deletions(-)
>  delete mode 100644 package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
>  create mode 100644 package/python-avro/0001-fix-pycodestyle-regression.patch
>  create mode 100644 package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
