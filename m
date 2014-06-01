From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 23:12:27 +0200
Subject: [Buildroot] [PATCH 01/26] package/rpi-firmware: bump
In-Reply-To: <378956497535d52b6dad5a505f50f70cbd535e8f.1401656581.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:03:25 +0200")
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <378956497535d52b6dad5a505f50f70cbd535e8f.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <87oayc1ghw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Yet another bump for the Raspberry Pi firmware:
 >   - HDMI: EDID override; HDCP fix; add command to control power to HDMI phy;
 >         fixes to mode selection
 >   - GPU: enable use of HW cursor; fix for GLES FFT compliance; fix scaling;
 >         remove arbitrary restrictions on output sizes
 >   - video-decode: better handle corrupted h264 streams, better allocate memory
 >   - misc: choose composite video when HDMI is not plugged

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
