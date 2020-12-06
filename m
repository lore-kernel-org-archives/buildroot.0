From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Dec 2020 23:25:51 +0100
Subject: [Buildroot] [PATCH v1] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
In-Reply-To: <20201117212519.7559-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 17 Nov 2020 22:25:19 +0100")
References: <20201117212519.7559-1-ps.report@gmx.net>
Message-ID: <87h7oyvafk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
 > 'depends on BR2_m68k' to 'depends on !BR2_m68k'.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
