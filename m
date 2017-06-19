From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 19 Jun 2017 00:22:07 -0300
Subject: [Buildroot] [PATCH 4/4 v2] tools: move check-package out of
 support/scripts/
References: <eb8cb9682d84d1f110044a1448f18ef95ad79e84.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <5947435fc2125_3a623fad069a6b206136c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 18, 2017 at 11:01 AM, Yann E. MORIN wrote:

> ---
>  support/scripts/check-package                      | 145 +--------------------
>  support/scripts/pkg-stats                          |   2 +-
>  tools/00-README.txt                                |   4 +
>  tools/check-package                                | 144 ++++++++++++++++++++
>  .../scripts => tools}/checkpackagelib/__init__.py  |   0
>  {support/scripts => tools}/checkpackagelib/base.py |   0
>  {support/scripts => tools}/checkpackagelib/lib.py  |   0
>  .../checkpackagelib/lib_config.py                  |   0
>  .../scripts => tools}/checkpackagelib/lib_hash.py  |   0
>  .../scripts => tools}/checkpackagelib/lib_mk.py    |   0
>  .../scripts => tools}/checkpackagelib/lib_patch.py |   0
>  .../scripts => tools}/checkpackagelib/readme.txt   |  10 +-
>  12 files changed, 155 insertions(+), 150 deletions(-)
>  mode change 100755 => 120000 support/scripts/check-package
>  create mode 100755 tools/check-package
>  rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/base.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_config.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_hash.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_mk.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_patch.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)

I forgot earlier...

Also the entry in the DEVELOPERS file must be updated
F:	support/scripts/check*package*

Probably if I didn't used '*' it would be easier to find.
I didn't tested but I assume we could use
F:	tools/check-package
F:	tools/checkpackagelib/

Regards,
Ricardo
