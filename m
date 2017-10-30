From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 11:36:51 +0100
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
Message-ID: <20171030113651.6b4bfc82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 15:36:37 -0500, Steve Kenton wrote:
> I recently began evaluating a switch to buildroot-2017.08 and started 
> getting the following message (transcribed from a screen shot)
> 
> ffprobe: Relink `/usr/lib64/libpng16.so.16' with 
> `/lib64/libpthread.so.0' for IFUNC symbol `longjmp'
> 
> As far as I can determine it is because libpng 1.6.31 uses longjmp() and 
> it needs another link dependency to avoid the runtime fixup above.
> 
> I did not see anything on the list about this and buildroot 2017-08.1 
> did not switch to libpng 1.6.32 although I'm building it anyway on 
> general principles.
> 
> So, is this likely a libpng build issue or should I start digging into? 
> ffmpeg?

Could you provide a minimal .config that exhibits the problem you're
seeing ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
