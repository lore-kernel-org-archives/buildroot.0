From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Mar 2012 14:52:08 +0200
Subject: [Buildroot] [PATCH] sudo: add fix for non-utmpx toolchains
In-Reply-To: <1333103753-29248-1-git-send-email-gustavo@zacarias.com.ar>
References: <1333103753-29248-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120330145208.047a4f51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Mar 2012 07:35:53 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> The utmpx defines for when the target systems lacks utmpx is incomplete,
> resulting in a build failure, so fix it.
> This can be triggered by a uClibc toolchain that lacks UTMPX in the
> configuration, or an older (<= 0.9.31) uClibc which lacks the
> functionality.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks for having fixed this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
