From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:06:01 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/freeswitch: select OpenCV
 modules needed for mod_cv
In-Reply-To: <1461312037-11008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461312037-11008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160422150601.054ff27c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 10:00:37 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/
> http://autobuild.buildroot.net/results/e53/e53e356451aa4541a76e26722fd71051896e774b/
> http://autobuild.buildroot.net/results/564/5649ff1b50a1eaafbd0e1a329bff87a65ce18da0/
> http://autobuild.buildroot.net/results/c60/c60f97c6aafb1a94cb4ce344953598eae8b4a912/
> http://autobuild.buildroot.net/results/c1a/c1ac61f9a77635962babdb6bfb31dbecb7f4d439/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: https://git.busybox.net/buildroot/commit/?id=fc23297c5cb7e3b36d8c8bacdd58e3babda3af85
>     added inter-modules dependencies, adjusted selected opencv options
>     and add patch proposed by Samuel to remove unneeded includes from
>     freeswitch
> v4: add more suboptions (Samuel)
> v3: add more suboptions
> v2: select the required suboption instead of checking for its existance
>     in freeswitch.mk (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
