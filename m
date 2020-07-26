From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jul 2020 09:09:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/enchant: bump to version 2.2.8
In-Reply-To: <20200725211201.866021-1-fontaine.fabrice@gmail.com>
References: <20200725211201.866021-1-fontaine.fabrice@gmail.com>
Message-ID: <20200726090929.3e712277@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 23:12:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest version
> - Update hash of COPYING.LIB (update in FSF address with
>   https://github.com/AbiWord/enchant/commit/adcb08292d4650a1c258f9b02c53cf1e26b47185)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/enchant/Config.in    | 2 +-
>  package/enchant/enchant.hash | 5 ++---
>  package/enchant/enchant.mk   | 5 +++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
