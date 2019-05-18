From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:28:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: needs gcc >= 6
In-Reply-To: <20190517132528.13269-1-fontaine.fabrice@gmail.com>
References: <20190517132528.13269-1-fontaine.fabrice@gmail.com>
Message-ID: <20190518212845.028c93f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 May 2019 15:25:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gcc requirement has been bumped from gcc 5 to gcc 6 since
> https://trac.webkit.org/browser/webkit/trunk/CMakeLists.txt?rev=231152
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/304956dda8e580cb39107e57a139cd1ae08ee655
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wpewebkit/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
