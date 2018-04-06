From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 23:38:37 +0200
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <20180225183415.8362-2-romain.naour@gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-2-romain.naour@gmail.com>
Message-ID: <20180406233837.25166b2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 19:34:14 +0100, Romain Naour wrote:
> This improve the reproducible build.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/strace/strace.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

I've updated the Config.in help text to indicate that libunwind should
be enabled to get "strace -k" support, as suggested by Thomas DS. And
then I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
