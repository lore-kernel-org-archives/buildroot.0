From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 21:52:40 +0100
Subject: [Buildroot] [PATCH 1/2 V3] Add bzip2 to host-python when it is
 selected (aids in compiling nodejs)
In-Reply-To: <1362099940-25020-1-git-send-email-daniel.price@gmail.com>
References: <1362099940-25020-1-git-send-email-daniel.price@gmail.com>
Message-ID: <20130304215240.5316cea9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Thu, 28 Feb 2013 17:05:40 -0800, Daniel Price wrote:
> Based off of patches posted by (and Signed-off-by): Jonathan Liu <net147@gmail.com>
> 
> Signed-off-by: Daniel Price <daniel.price@gmail.com>

If you add the attached patch to the nodejs package, then we no longer
need the bz2 module in Python, at least not in the default nodejs build.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: nodejs-remove-python-bz2-dependency.patch
Type: text/x-patch
Size: 824 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130304/ba1efdd2/attachment.bin>
