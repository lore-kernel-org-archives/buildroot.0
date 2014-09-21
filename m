From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:48:12 +0200
Subject: [Buildroot] [PATCH v2 1/2] iprutils: bump version to 2.4.2 and
 update patches
In-Reply-To: <1411032208-62586-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1411032208-62586-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140921194812.01424179@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 18 Sep 2014 10:23:27 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../iprutils/iprutils-0001-Don-t-use-gettext.patch |   32 ++++++++++++++++++++
>  ...low-CFLAGS-to-be-extended-from-the-enviro.patch |   31 +++++++++++++++++++
>  .../iprutils/iprutils-01-dont-use-gettext.patch    |   30 ------------------
>  .../iprutils-02-use-environment-cflags.patch       |   20 ------------
>  package/iprutils/iprutils.mk                       |    2 +-
>  5 files changed, 64 insertions(+), 51 deletions(-)
>  create mode 100644 package/iprutils/iprutils-0001-Don-t-use-gettext.patch
>  create mode 100644 package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
>  delete mode 100644 package/iprutils/iprutils-01-dont-use-gettext.patch
>  delete mode 100644 package/iprutils/iprutils-02-use-environment-cflags.patch

Both patches applied. Thanks to you, and thanks Gustavo for the testing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
