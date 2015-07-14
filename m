From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 16:03:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: version bump to 0.10.40
In-Reply-To: <1436880003-9098-1-git-send-email-martin@barkynet.com>
References: <1436880003-9098-1-git-send-email-martin@barkynet.com>
Message-ID: <20150714160311.761e2ba1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Tue, 14 Jul 2015 14:20:03 +0100, Martin Bark wrote:
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../{0.10.39 => 0.10.40}/0001-remove-python-bz2-dependency.patch      | 0
>  .../{0.10.39 => 0.10.40}/0002-gyp-force-link-command-to-use-CXX.patch | 0
>  package/nodejs/{0.10.39 => 0.10.40}/0003-use-python-variable.patch    | 0
>  .../0004-fix-build-error-without-OpenSSL-support.patch                | 0
>  package/nodejs/Config.in                                              | 4 ++--
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  6 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/nodejs/{0.10.39 => 0.10.40}/0001-remove-python-bz2-dependency.patch (100%)
>  rename package/nodejs/{0.10.39 => 0.10.40}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{0.10.39 => 0.10.40}/0003-use-python-variable.patch (100%)
>  rename package/nodejs/{0.10.39 => 0.10.40}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
