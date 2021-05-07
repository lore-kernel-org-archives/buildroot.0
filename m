From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 May 2021 10:36:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4
 kernels
In-Reply-To: <20210504194540.GN2137340@scaer> (Yann E. MORIN's message of
 "Tue, 4 May 2021 21:45:40 +0200")
References: <20210203100939.17390-1-fede@evolware.org>
 <20210504194540.GN2137340@scaer>
Message-ID: <8735uz0wle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Federico, All,
 > On 2021-02-03 11:09 +0100, Federico Pellegrin spake thusly:
 >> kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
 >> 
 >> This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.
 >> 
 >> Signed-off-by: Federico Pellegrin <fede@evolware.org>

 > This patch is no longer needed now that we updated kexec to 2.0.21, then
 > 2.0.22.

But on 2021.02.x we still have 2.0.20, so committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
