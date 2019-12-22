From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:14:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/apitrace: needs threads
In-Reply-To: <20191217201202.643563-1-fontaine.fabrice@gmail.com>
References: <20191217201202.643563-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222111405.68ae5633@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Dec 2019 21:12:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apitrace uses its own version of gtest which depends on threads since
> version 8.0 and
> https://github.com/apitrace/apitrace/commit/85cf7c8b86129699246574dfeec846e88a3f88a2
> 
> Moreover, apitrace also uses std::thread in lib/os/os_thread.hpp
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/03c4939fdfb7366c1835df946c4e869cd2b87b9f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apitrace/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
