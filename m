From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:31:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/avro-c: fix build without C++
In-Reply-To: <20191230135012.909578-1-fontaine.fabrice@gmail.com>
References: <20191230135012.909578-1-fontaine.fabrice@gmail.com>
Message-ID: <20191231153149.3cf62805@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Dec 2019 14:50:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/135e246aa70f28c6b9aea5fd6b0eb9c7b45ebfe7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...2-CMakeLists.txt-fix-build-without-C.patch | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 package/avro-c/0002-CMakeLists.txt-fix-build-without-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
