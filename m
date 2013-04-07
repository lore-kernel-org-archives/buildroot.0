From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:01:11 +0200
Subject: [Buildroot] [PATCH 1/4] toolchain/arm: drop generic and old,
 add fa526/626, unify strongarm
In-Reply-To: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130407220111.2e9b5b7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  4 Apr 2013 14:29:45 -0300, Gustavo Zacarias wrote:
> * Add Faraday FA526/626 as suggested on bug #1291
> Note however that these cores are v4 and NOT v4t.
> 
> * Make the sa110 & sa1110 cores -> strongarm since they're the same.
> 
> * Drop all of the ARM variants lower than v4 including generic,
> there's no point in supporting obsolete targets.
> 
> * Fix uClibc USE_BX logic, it was always on, this would break the new
> FA526/626 support and broke StrongARM since it's a v4 core.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

For the four patches:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
