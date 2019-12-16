From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:46:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/apitrace: needs wchar
In-Reply-To: <20191214113817.1017079-2-fontaine.fabrice@gmail.com>
References: <20191214113817.1017079-1-fontaine.fabrice@gmail.com>
 <20191214113817.1017079-2-fontaine.fabrice@gmail.com>
Message-ID: <20191216224619.10e3eee5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 12:38:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apitrace uses its own version of gtest which depends on wchar since
> version 8.0 and
> https://github.com/apitrace/apitrace/commit/85cf7c8b86129699246574dfeec846e88a3f88a2
> 
> Moreover, apitrace also uses wcslen in trace_writer.cpp since at least
> version 8.0 and
> https://github.com/apitrace/apitrace/commit/5e9a2b11b248aaa2f6f353bbcf9f600d65bcaf51
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5f27556ccc9daec578fe1bf2ed516ca9921ed474
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apitrace/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
