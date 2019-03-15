From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:00:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to
 version 0.9.0
In-Reply-To: <20190315205658.28939-1-fontaine.fabrice@gmail.com>
References: <20190315205658.28939-1-fontaine.fabrice@gmail.com>
Message-ID: <20190315220000.0e6c4b0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 21:56:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version:
>   https://github.com/gorakhargosh/watchdog/commit/268a46dabc10ff8dcc5a123ca8c8ceb2e9189f2a)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dd-a-workaround-to-support-uClibc-library.patch | 43 ----------------------
>  package/python-watchdog/python-watchdog.hash       | 11 ++++--
>  package/python-watchdog/python-watchdog.mk         |  4 +-
>  3 files changed, 9 insertions(+), 49 deletions(-)
>  delete mode 100644 package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
