From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:59:12 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/gettext-tiny: support
 gettext 0.20.1
In-Reply-To: <20200421205504.3061551-3-aduskett@gmail.com>
References: <20200421205504.3061551-1-aduskett@gmail.com>
 <20200421205504.3061551-3-aduskett@gmail.com>
Message-ID: <20200427235912.69b4627c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 13:55:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Update gettext to 0.20.1 and the respective hashes.
>   - Remove share/gettext-tiny/m4/lock.m4 from GETTEXT_TINY_EXTRA_GETTEXT_FILES
>     and the install list, as this file was removed in commit
>     8c2bfdbddb13a480d88ceac4ab0e5886bda957cb.
> 
> Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7
> 
>             br-arm-full [1/6]: OK
>  br-arm-cortex-a9-glibc [2/6]: OK
>   br-arm-cortex-m4-full [3/6]: OK
>          br-x86-64-musl [4/6]: OK
>      br-arm-full-static [5/6]: OK
>            sourcery-arm [6/6]: OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 7 +++----
>  package/gettext-tiny/gettext-tiny.mk   | 4 +---
>  2 files changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
