From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:17:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/acpica: bump version to 20191018
In-Reply-To: <20191026075638.9003-1-bernd.kuhls@t-online.de>
References: <20191026075638.9003-1-bernd.kuhls@t-online.de>
Message-ID: <20191026151745.465e77ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 26 Oct 2019 09:56:38 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch due to upstream commit
> https://github.com/acpica/acpica/commit/36037bdaf0ab843b7304d538d4e5cbc0c9524024
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../acpica/0001-build-do-not-use-Werror.patch | 27 ++++++++++++++-----
>  package/acpica/acpica.hash                    |  2 +-
>  package/acpica/acpica.mk                      |  2 +-
>  3 files changed, 23 insertions(+), 8 deletions(-)

Applied to master, thanks. However, could you prepare and send upstream
a patch that allows to disable -Werror? Something like a NO_WERROR make
variable, which when set, doesn't add -Werror ?

For the generate/unix/iasl/Makefile file, you of course first want a
preparation patch that factorizes the definition of -Wall -Werror.

Upstreaming such a patch would reduce a bit the maintenance burden.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
