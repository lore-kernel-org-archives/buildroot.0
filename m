From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 13 Oct 2014 15:37:57 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <543BD5B5.4000602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi,

Danomi Manchego wrote:
> The internal copy of libav in gst-ffmpeg does not understand the
> PKG_CONFIG env variable, so it throws a line like this at the end
> of its configuration:
>
> WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.

I tried to reproduce the issue, but the message didn't show up.
Can you chare a defconfig to reproduce the issue?

Thanks.

-- 
Luca
