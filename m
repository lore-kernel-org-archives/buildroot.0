From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Feb 2017 14:52:32 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20170203205745.14488-3-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-3-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LUOWs15osq9Hv1bkG45aGTm2Q6Ao1bgpWt36GLqyu57sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 3, 2017 at 9:57 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Functions to obtain the version and dependencies of a package from Python
> can be useful for several scripts. Extract this logic out of graph-depends
> into pkgutil.py.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/scripts/graph-depends | 55 ++++---------------------------------------
>  support/scripts/pkgutil.py    | 55 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 51 deletions(-)
>  create mode 100644 support/scripts/pkgutil.py
>

Please disregard this specific patch, it does not work on current
Buildroot. It was accidentally sent along with the real 3-patch series
(which does work).
