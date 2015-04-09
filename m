From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 11:55:32 +0200
Subject: [Buildroot] [PATCH] php: allow cache for strcasestr test
In-Reply-To: <1428543150-10434-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428543150-10434-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150409115532.1a129863@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 22:32:30 -0300, Gustavo Zacarias wrote:
> Fileinfo does an AC_TRY_RUN to test for strcasestr without allowing a
> canned response, hence breaking cross-compiles. Use AC_CACHE_VAL. Fixes:
> http://autobuild.buildroot.net/results/10a/10ae44cbc7c0c8e6f1ac54dae4c9d94c703aa3dd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
