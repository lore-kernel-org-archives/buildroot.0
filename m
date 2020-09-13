From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 16:22:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: security bump to
 version 0.9.5
In-Reply-To: <20200911210306.617737-1-fontaine.fabrice@gmail.com>
References: <20200911210306.617737-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913162203.25235a4f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 23:03:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - Fix CVE-2020-16135: libssh 0.9.4 has a NULL pointer dereference in
>   tftpserver.c if ssh_buffer_new returns NULL.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-libssh.h-bump-to-version-0.9.4.patch | 29 ------------
>  ...eturning-SSH_AGAIN-from-ssh_channel_.patch | 45 -------------------
>  package/libssh/libssh.hash                    |  4 +-
>  package/libssh/libssh.mk                      |  2 +-
>  4 files changed, 3 insertions(+), 77 deletions(-)
>  delete mode 100644 package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
>  delete mode 100644 package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
