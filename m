From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:11:52 +0100
Subject: [Buildroot] [PATCH 08/14] diffconfig: fix code style
In-Reply-To: <1516581882-30582-9-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1516581882-30582-9-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180129231152.5e3ee075@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Jan 2018 22:44:36 -0200, Ricardo Martincoski wrote:
> Fix these warnings:
> E225 missing whitespace around operator
> E231 missing whitespace after ','
> E302 expected 2 blank lines, found 1
> E305 expected 2 blank lines after class or function definition, found 1
> E401 multiple imports on one line
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>

I haven't applied this one, because I don't really like the fact that
we're further tweaking a script that comes from the kernel sources. On
the other hand, we have already tweaked it for our purposes.

What do others think? Should we stay as close to the original upstream
version as possible? Or because we have anyway already tweaked it, we
don't really care and can now do whatever changes we believe are useful?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
