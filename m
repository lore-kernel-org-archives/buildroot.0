From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:17:03 +1300
Subject: [Buildroot] [PATCH 1/3] mkpimage: rewrite to support header
 version 1
In-Reply-To: <20170126112831.28107-1-lionel@svkt.org>
References: <20170126112516.h465tdgnpl4ixh3f@ed>
 <20170126112831.28107-1-lionel@svkt.org>
Message-ID: <20170127211703.7e7d1113@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 12:28:31 +0100, Lionel Flandrin wrote:
> mkpimage is a proprietary tool part of Altera's Embedded Development
> Suite which is used to generate the image files supported by their
> BootROMs.
> 
> Newer versions of their SoCs (such as the Arria 10) use header version
> 1 which was not supported by the previous version of this tool.
> 
> This new version supports header version 1, improves error handling
> and tweaks the output to bring it closer to Altera's own tool. In
> particular the padding calculations have been changed. In all the
> configurations tested this program and Altera's mkpimage produce
> exactly the same files (while the previous version didn't).
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>

Why not import the new version of this program available in Barebox,
which does support V1 headers nowadays?

Otherwise, where does your version comes from?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
