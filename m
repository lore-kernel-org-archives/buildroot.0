From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:46:56 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: add C++11 dependencies
In-Reply-To: <20180509093328.25493-1-fontaine.fabrice@gmail.com>
References: <20180509093328.25493-1-fontaine.fabrice@gmail.com>
Message-ID: <20180511234656.5c488423@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 11:33:28 +0200, Fabrice Fontaine wrote:
> log4cplus uses std::future which is a C++11 feature affected by the gcc
> bug 64735
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4f4e9ed5dd5bad76eeee5d151e958f22603615b3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cplus/Config.in | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
