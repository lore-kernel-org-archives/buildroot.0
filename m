From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 27 Apr 2015 08:20:09 +0000
Subject: [Buildroot] uClibc build verbosity control
Message-ID: <C2D7FE5348E1B147BCA15975FBA230756659BC9F@IN01WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

uClibc verbosity control V=xx is different from other mainstream projects: namely Busybox and Linux kernel.
To print full cmdlines (when debugging obscure toolchain issues) we need to pass V=2 whereas kernel/busybox take V=1.

Can this be changed (I can provide a patch) assuming this doesn't break existing scripts upsetting some people.

My issue is specifically when using likes of Buildroot, there's no obvious way to get the cmdlines of uClibc and/or other projects (unless there's some obvious way I'm missing).

Thx,
-Vineet
