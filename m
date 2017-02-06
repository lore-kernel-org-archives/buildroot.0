From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 13:49:58 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20170203205745.14488-4-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
Message-ID: <20170206134958.377cdf5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Feb 2017 21:57:44 +0100, Thomas De Schampheleire wrote:
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

Applied to master, after removing the shebang from pkgutil.py as
suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
