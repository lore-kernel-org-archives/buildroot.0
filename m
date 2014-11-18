From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:38:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/openssl: rename patches to the
 new convention
In-Reply-To: <1416146446-27060-2-git-send-email-bernd.kuhls@t-online.de>
References: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
 <1416146446-27060-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141118233831.0fe12291@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 16 Nov 2014 15:00:46 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...openssl-001-do-not-build-docs.patch => 001-do-not-build-docs.patch} |    0
>  ...002-dont-force-large-file.patch => 002-dont-force-large-file.patch} |    0
>  ...n.patch => 003-cryptodev-Fix-issue-with-signature-generation.patch} |    0
>  .../openssl/{openssl-004-musl-termios.patch => 004-musl-termios.patch} |    0
>  .../{openssl-005-parallel-build.patch => 005-parallel-build.patch}     |    0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/openssl/{openssl-001-do-not-build-docs.patch => 001-do-not-build-docs.patch} (100%)
>  rename package/openssl/{openssl-002-dont-force-large-file.patch => 002-dont-force-large-file.patch} (100%)
>  rename package/openssl/{openssl-003-cryptodev-Fix-issue-with-signature-generation.patch => 003-cryptodev-Fix-issue-with-signature-generation.patch} (100%)
>  rename package/openssl/{openssl-004-musl-termios.patch => 004-musl-termios.patch} (100%)
>  rename package/openssl/{openssl-005-parallel-build.patch => 005-parallel-build.patch} (100%)

Applied to next, thanks. Obviously, I've dropped the part of this patch
that renames the parallel build patch, since I haven't applied PATCH
1/2 of this series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
