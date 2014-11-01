From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:15:50 +0100
Subject: [Buildroot] [PATCH 26/51] qjson: bump version
In-Reply-To: <1414349157-22749-26-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-26-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141101231550.033dfcba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:32 +0100, Maxime Hadjinlian wrote:
> Remove useless empty line.
> Update the patch and its name.
> 
> We change from a release from Nov 2012 to a commit, because the project
> and there has been quite a number of commits since then.
> 
> The patch will be sent upstream along with a request for a new release.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  ...1-fix-Qt4-package-error-in-CMakeLists.txt.patch | 29 ++++++++++++++++++++++
>  ...qjson-fix-qt4-package-error-in-cmakelists.patch | 29 ----------------------
>  package/qjson/qjson.mk                             |  3 +--
>  3 files changed, 30 insertions(+), 31 deletions(-)
>  create mode 100644 package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
>  delete mode 100644 package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
