From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 18:48:37 +0100
Subject: [Buildroot] [PATCH 1/1] libvncserver: disable libva support
In-Reply-To: <1419699691-7765-1-git-send-email-bos@je-eigen-domein.nl>
References: <1419699691-7765-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20141227184837.5de867ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sat, 27 Dec 2014 18:01:31 +0100, Floris Bos wrote:
> The libvncclient library (part of libvncserver) has optional support
> for HW accelerated H264 video playback using libva
> 
> However there are currently two problems with it:
> 
> 1) it only supports libva compiled with X11 support enabled, but it
>    does not verify that is the case, resulting in compile errors.
> 
> 2) it only supports the libva 1.0.x API, and not newer
>    libva versions, like 1.4.x we include with buildroot.
> 
>    https://github.com/LibVNC/libvncserver/issues/11
> 
> Disabling libva support for now.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
