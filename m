From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:03:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 0.10.43
In-Reply-To: <1457349195-21376-1-git-send-email-martin@barkynet.com>
References: <1457349195-21376-1-git-send-email-martin@barkynet.com>
Message-ID: <20160308210329.6cfca47c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Mon,  7 Mar 2016 11:13:15 +0000, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v0.10.43/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../{0.10.42 => 0.10.43}/0001-remove-python-bz2-dependency.patch      | 0
>  .../{0.10.42 => 0.10.43}/0002-gyp-force-link-command-to-use-CXX.patch | 0
>  .../{0.10.42 => 0.10.43}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
>  .../nodejs/{0.10.42 => 0.10.43}/0004-Fix-support-for-uClibc-ng.patch  | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  6 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{0.10.42 => 0.10.43}/0001-remove-python-bz2-dependency.patch (100%)
>  rename package/nodejs/{0.10.42 => 0.10.43}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{0.10.42 => 0.10.43}/0003-fix-musl-USE-MISC-build-issue.patch (100%)
>  rename package/nodejs/{0.10.42 => 0.10.43}/0004-Fix-support-for-uClibc-ng.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
