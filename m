From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:46:32 +0100
Subject: [Buildroot] [PATCH v2 1/1] vnstat: bump to version 1.15
In-Reply-To: <1450885136-11511-1-git-send-email-rprebello@gmail.com>
References: <1450885136-11511-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151223174632.40855537@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Wed, 23 Dec 2015 13:38:56 -0200, Rodrigo Rebello wrote:
> Also:
> 
>   - Remove no longer needed patch (merged upstream).
>   - Adapt vnstat.mk to the new autotools-based build system.
>   - Include patch to improve gd library usability check + add
>     configure option to explicitly disable that check.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix typo in commit message (s/longed/longer/).
> ---
>  ...-fcntl.h-include-needed-by-open-closes-21.patch | 28 ------------
>  ...ure.ac-add-option-to-disable-image-output.patch | 51 ++++++++++++++++++++++
>  package/vnstat/vnstat.hash                         |  2 +-
>  package/vnstat/vnstat.mk                           | 27 +++++-------
>  4 files changed, 64 insertions(+), 44 deletions(-)
>  delete mode 100644 package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch
>  create mode 100644 package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
