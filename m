From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Nov 2010 17:13:31 +0100
Subject: [Buildroot] [PATCH 11/21] libelf: bump to 0.8.13
In-Reply-To: <1284864823-18993-12-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
	<1284864823-18993-12-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101105171331.23cf6389@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Sep 2010 19:53:33 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
> ---
>  package/libelf/libelf-0.8.10-Elf64-fixups.patch |12361 -----------------------
>  package/libelf/libelf-0.8.13-Elf64-fixups.patch |12361 +++++++++++++++++++++++
>  package/libelf/libelf.mk                        |    2 +-
>  3 files changed, 12362 insertions(+), 12362 deletions(-)
>  delete mode 100644 package/libelf/libelf-0.8.10-Elf64-fixups.patch
>  create mode 100644 package/libelf/libelf-0.8.13-Elf64-fixups.patch

Instead of carrying this huge patch to the configure script, I'd prefer
if the patch was limited to configure.in, and LIBELF_AUTORECONF=YES was
used.

And even better, it'd be nice to get this configure.in patch merged
upstream.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
