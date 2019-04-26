From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:13:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/websocketpp: fix build with
 boost 1.70.0
In-Reply-To: <20190425213428.7883-1-fontaine.fabrice@gmail.com>
References: <20190425213428.7883-1-fontaine.fabrice@gmail.com>
Message-ID: <20190426091327.0428e1b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 23:34:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of libcpprestsdk with boost 1.70.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/65840c7c5b337f1d4e5768d8e68198a5449603fd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-make_shared-with-new-in-some-cases.patch | 79 +++++++++++++++++++
>  .../0002-Fix-missed-entries-fix-testing.patch | 66 ++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 package/websocketpp/0001-Replace-make_shared-with-new-in-some-cases.patch
>  create mode 100644 package/websocketpp/0002-Fix-missed-entries-fix-testing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
