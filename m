From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:08:36 +0200
Subject: [Buildroot] [PATCH] libidn: security bump to version 1.33
In-Reply-To: <1469230714-4779-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469230714-4779-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723150836.6c01528e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 20:38:34 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-8948 - out-of-bounds read in CLI tool.
> CVE-2016-6261 - out-of-bounds stack read in idna_to_ascii_4i.
> CVE-2016-6262 - followup fix to CVE-2015-8948.
> CVE-2016-6263 - stringprep_utf8_nfkc_normalize reject invalid UTF-8.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libidn/libidn.hash | 6 ++++--
>  package/libidn/libidn.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
