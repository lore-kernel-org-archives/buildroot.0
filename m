From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:05:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: bump to version 3.7.0
In-Reply-To: <20201025093742.394168-1-fontaine.fabrice@gmail.com>
References: <20201025093742.394168-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025110531.7b2d8839@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 10:37:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - libfuse3 is needed since version 3.0.0 and
>   https://github.com/libfuse/sshfs/commit/34146444ce20c477cba7e9fe113e4387da32ae94
> - Switch to meson-package
> 
> https://github.com/libfuse/sshfs/blob/sshfs-3.7.0/ChangeLog.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sshfs/Config.in  | 8 ++++----
>  package/sshfs/sshfs.hash | 2 +-
>  package/sshfs/sshfs.mk   | 9 +++++----
>  3 files changed, 10 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
