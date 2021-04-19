From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:28:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/yavta: disable -Werror
In-Reply-To: <20210417110015.1904070-1-fontaine.fabrice@gmail.com>
References: <20210417110015.1904070-1-fontaine.fabrice@gmail.com>
Message-ID: <20210419232837.48ea2859@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Apr 2021 13:00:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build failure which is raised since bump to latest version in commit
> 87ba7be02fdd185668f86a59539343c70e1108e0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d5b4f69f46cef4dd11410fe48d21372cb883ae4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/yavta/yavta.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
