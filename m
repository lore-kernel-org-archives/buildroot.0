From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:05:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/grpc: fix build with glibc 2.30
In-Reply-To: <20190916165331.19894-1-fontaine.fabrice@gmail.com>
References: <20190916165331.19894-1-fontaine.fabrice@gmail.com>
Message-ID: <20190917220553.3b814c84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 18:53:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/42eb63a89228d340cab05c7ab65fab9b02814689
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0004-Fix-gettid-naming-conflict.patch     | 36 ++++++++
>  .../grpc/0005-Rename-gettid-functions.patch   | 83 +++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 package/grpc/0004-Fix-gettid-naming-conflict.patch
>  create mode 100644 package/grpc/0005-Rename-gettid-functions.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
