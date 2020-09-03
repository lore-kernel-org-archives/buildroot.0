From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.0.0
In-Reply-To: <20200829213916.2909668-1-fontaine.fabrice@gmail.com>
References: <20200829213916.2909668-1-fontaine.fabrice@gmail.com>
Message-ID: <20200903205619.1a95ee9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 23:39:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use cmake which is available since version 1.0.0 and
>   https://github.com/redis/hiredis/commit/ead586a2cb7de8a17073a96704a4200d63a380e5
> - Disable tests
> - Add openssl optional dependency
> 
> https://github.com/redis/hiredis/blob/v1.0.0/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-CMakeLists.txt-do-not-force-SHARED.patch | 47 ++++++++++++++
>  package/hiredis/hiredis.hash                  |  2 +-
>  package/hiredis/hiredis.mk                    | 65 +++----------------
>  3 files changed, 57 insertions(+), 57 deletions(-)
>  create mode 100644 package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
