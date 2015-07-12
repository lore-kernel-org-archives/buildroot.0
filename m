From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 12:31:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: version bump to 0.12.7
In-Reply-To: <1436688777-5421-1-git-send-email-joerg.krause@embedded.rocks>
References: <1436688777-5421-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150712123142.017d2a22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 12 Jul 2015 10:12:57 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
>  .../{0.12.6 => 0.12.7}/0002-gyp-force-link-command-to-use-CXX.patch   | 0
>  .../0003-Use-a-python-variable-instead-of-hardcoding-Python.patch     | 0
>  .../0004-fix-build-error-without-OpenSSL-support.patch                | 0
>  package/nodejs/Config.in                                              | 4 ++--
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  6 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/nodejs/{0.12.6 => 0.12.7}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
>  rename package/nodejs/{0.12.6 => 0.12.7}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{0.12.6 => 0.12.7}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
>  rename package/nodejs/{0.12.6 => 0.12.7}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
