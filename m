From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:52:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: bump to version
 2.10.8
In-Reply-To: <20191006184825.17264-1-fontaine.fabrice@gmail.com>
References: <20191006184825.17264-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008225221.221cb6c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 20:48:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Fix-namespace-our-gettid-wrapper.patch | 66 -------------------
>  package/lttng-tools/lttng-tools.hash          |  4 +-
>  package/lttng-tools/lttng-tools.mk            |  2 +-
>  3 files changed, 3 insertions(+), 69 deletions(-)
>  delete mode 100644 package/lttng-tools/0001-Fix-namespace-our-gettid-wrapper.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
