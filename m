From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:14:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.3
In-Reply-To: <20210130170827.2720867-1-fontaine.fabrice@gmail.com>
References: <20210130170827.2720867-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131231446.2ef1b2e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 18:08:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second patch (already in version)
> - Update hash of README, FrankAudiodata added and update in year:
>   https://github.com/brltty/brltty/commit/76852b0214edea71ce36a1f8a905294a164e7f34
>   https://github.com/brltty/brltty/commit/fdf19475c9b13125c2b7cb09e7d4c18bdf308e97
>   https://github.com/brltty/brltty/commit/8f040b2ab8913b182fb87e3bcfa1f315235120cd
>   https://github.com/brltty/brltty/commit/90fd84da90e2354d27a12fbe47728a5491fe8e72
> - Update indentation in hash file (two spaces)
> 
> https://brltty.app/doc/ChangeLog.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nput_event-time-related-compile-fail.patch | 52 -------------------
>  package/brltty/brltty.hash                    |  6 +--
>  package/brltty/brltty.mk                      |  2 +-
>  3 files changed, 4 insertions(+), 56 deletions(-)
>  delete mode 100644 package/brltty/0002-fix-input_event-time-related-compile-fail.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
