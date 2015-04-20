From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 11:35:16 +0200
Subject: [Buildroot] [PATCH v2] live555: fix library installation
In-Reply-To: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
References: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150420113516.53c9199f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 20 Apr 2015 10:42:31 +0200, Luca Ceresoli wrote:

> -if BR2_PACKAGE_LIVE555
> -
> -config BR2_PACKAGE_LIVE555_OPENRTSP
> -	bool "OpenRTSP"
> -	default y
> -	help
> -	  Live555 RTSP Client.
> -
> -config BR2_PACKAGE_LIVE555_MEDIASERVER
> -	bool "live555MediaServer"
> -	default y
> -	help
> -	  RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
> -
> -config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
> -	bool "MPEG2TransportStreamIndexer"
> -	default y
> -	help
> -	  MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
> -	  operation in the Live555MediaServer.
> -
> -endif

Config.in.legacy handling?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
