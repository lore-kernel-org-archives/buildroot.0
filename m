From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:09:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libmatroska: bump to
 version 1.6.2
In-Reply-To: <20200829202448.2825994-1-fontaine.fabrice@gmail.com>
References: <20200829202448.2825994-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829230924.578a10b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:24:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Extract from ChangeLog:
>  - In release 1.6.1 the version number in CMakeLists.txt wasn't
>    updated, affecting the installed cmake and pkgconfig files. The
>    version number has been bumped to 1.6.2 in all relevant files now.
>  - "KaxBlockAddIDValue" class: this class is no longer marked as
>    "mandatory" in order to coincide with the latest specification.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmatroska/libmatroska.hash | 2 +-
>  package/libmatroska/libmatroska.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
