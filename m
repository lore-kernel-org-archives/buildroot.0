From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:49:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 5.10.1
In-Reply-To: <1460250567-14254-1-git-send-email-martin@barkynet.com>
References: <1460250567-14254-1-git-send-email-martin@barkynet.com>
Message-ID: <20160413224926.10ab3c5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 02:09:27 +0100, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v5.10.1/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
>  .../{5.9.1 => 5.10.1}/0002-gyp-force-link-command-to-use-CXX.patch    | 0
>  package/nodejs/{5.9.1 => 5.10.1}/0003-Fix-va_list-not-declared.patch  | 0
>  package/nodejs/{5.9.1 => 5.10.1}/0004-Fix-support-for-uClibc-ng.patch | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  6 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{5.9.1 => 5.10.1}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
>  rename package/nodejs/{5.9.1 => 5.10.1}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{5.9.1 => 5.10.1}/0003-Fix-va_list-not-declared.patch (100%)
>  rename package/nodejs/{5.9.1 => 5.10.1}/0004-Fix-support-for-uClibc-ng.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
