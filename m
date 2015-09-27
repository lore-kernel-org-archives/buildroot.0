From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 21:15:06 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-input-vmmouse: dep on udev
In-Reply-To: <1441888256-15742-1-git-send-email-brendanheading@gmail.com>
References: <1441888256-15742-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150927211506.07b96f4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Thu, 10 Sep 2015 13:30:56 +0100, Brendan Heading wrote:
> Fixes:
> http://autobuild.buildroot.net/results/cd3/cd3730ed0272c3f335ee90e0cbc4027b07945db3/
> 
> The xdriver_xf86-input-vmmouse driver depends on udev.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

I've instead applied a different patch from Bernd:
http://git.buildroot.net/buildroot/commit/?id=29c12df3a735ae61891bcf1b90daf0bfd00db7c8.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
