From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Aug 2013 12:28:24 +0200
Subject: [Buildroot] [PATCH 2/3] ltrace: Fix a May be unitialized
 variable
In-Reply-To: <1376041019-26688-3-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-3-git-send-email-jezz@sysmic.org>
Message-ID: <20130809122824.4005a69e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  9 Aug 2013 11:36:58 +0200, J?r?me Pouiller wrote:
> Compilation may failed if rlm is not initialized and ltrace
> is compiled with -Werror.

In general, we try to avoid compiling things with -Werror, but ok, why
not.

Can you add a description + Signed-off-by line to the patch, and send
it upstream? Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
