From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:29:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/uvw: disable documentation
In-Reply-To: <20191031124754.31381-1-fontaine.fabrice@gmail.com>
References: <20191031124754.31381-1-fontaine.fabrice@gmail.com>
Message-ID: <20191102222934.0ce4fe5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 13:47:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add patch to disable documentation through BUILD_DOC which is already
> passed by cmake-infrastructure
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f58a1d1a4ffdaf94fd0fcb4dbebe1e898f95638d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-CMakeLists.txt-add-BUILD_DOC-option.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
