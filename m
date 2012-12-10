From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Dec 2012 10:09:45 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: bumpimg default
 GCC version to 4.6.3
In-Reply-To: <20121209203933.44D7B9A158@busybox.osuosl.org>
References: <20121209203933.44D7B9A158@busybox.osuosl.org>
Message-ID: <20121210100945.0ccfbe69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Dec 2012 19:27:09 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=5c22945d7560c4a5cf184441b8bba7e48c5d099e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This bumps the GCC version from 4.4.6 to 4.6.3 to for
> *.config-eglibc
> *.config-glibc
> *.config-uClibc
> be equal to the default GCC setting in buildroot as well in addition to
> commit b855154ee8683e87afa08c6cc50b716d22879922.
> 
> Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  .../crosstool-ng.config-eglibc                     |   26 ++++++++++++++++----
>  .../crosstool-ng.config-glibc                      |   26 ++++++++++++++++----
>  .../crosstool-ng.config-uClibc                     |   26 ++++++++++++++++----
>  3 files changed, 63 insertions(+), 15 deletions(-)

The recent updates to the crosstool-ng configs is apparently breaking
the build:

  http://autobuild.buildroot.org/results/b99c757884d14bbe8893900824763f63dd13f5dc/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
