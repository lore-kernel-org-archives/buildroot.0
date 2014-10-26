From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:53:32 +0100
Subject: [Buildroot] [PATCH v4 1/4] gst-ffmpeg: add option to select GPL
 vs LGPL build
In-Reply-To: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
References: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20141026165332.03b0c037@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 19 Oct 2014 15:33:19 -0400, Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I've applied patches 1, 2 and 3 from your series. However, I haven't
applied patch 4, because I believe switching from 'config' to
'menuconfig' for gst-ffmpeg isn't really necessary, since gst-ffmpeg
has only one sub-option. The other gst-plugins-* packages that use
menuconfig have lots of suboptions, which justify menuconfig.

If you don't agree, feel free to argue more :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
