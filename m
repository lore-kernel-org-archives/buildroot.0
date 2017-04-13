From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:36:13 +0200
Subject: [Buildroot] [PATCH v4] libgphoto2: new package
In-Reply-To: <1491894008-29767-1-git-send-email-kevin.joly@sensefly.com>
References: <1491894008-29767-1-git-send-email-kevin.joly@sensefly.com>
Message-ID: <20170413223613.7f78235a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 09:00:08 +0200, Kevin JOLY wrote:
> Add support for libgphoto2 core library designed to allow access to
> digital camera.
> 
> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v3 -> v4 (suggested by Arnout Vandecappelle and Romain Naour)
>   - Fix style issues
>   - Replace the libjpeg optional dependency by jpeg
>   - Improve configure options

I've applied to master, after fixing/improving a few remaining things:

    [Thomas:
     - Use downloads.sourceforge.net
     - Remove final dot at end of <pkg>_LICENSE variable
     - Minor tweaks in comments.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
