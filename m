From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 23:02:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix static build with
 uclibc
In-Reply-To: <20210402181458.1554685-1-fontaine.fabrice@gmail.com>
References: <20210402181458.1554685-1-fontaine.fabrice@gmail.com>
Message-ID: <20210422230225.46cd77d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Apr 2021 20:14:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix static build with uclibc which is raised since bump to version
> 2020-12-R3 in commit 14522a8f9d272204763c49a21ebce5653430c612
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69dcb7ac99e63fca342e4d52d9311d1ee1931911
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kismet/kismet.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
