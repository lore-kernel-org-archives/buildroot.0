From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 21:22:00 +0100
Subject: [Buildroot] [PATCH] packages/flex: remove unnecessary
 BR2_PACKAGE_FLEX_LIBFL
In-Reply-To: <1362687441-500-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362687441-500-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130307212200.6015f2da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  7 Mar 2013 17:17:21 -0300, Gustavo Zacarias wrote:
> The BR2_PACKAGE_FLEX_LIBFL knob was removed by
> bd72a13a4ca3033bacbaf9e9a2b424acf149f83d so remove it from the packages
> that used it since it's completely unnecessary.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
