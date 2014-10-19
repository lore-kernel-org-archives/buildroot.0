From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 17:28:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Fix build with
	BR2_ENABLE_DEBUG=yes
References: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3CBB1C9B9F9DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1413732225-14832-1-git-send-email-bernd.kuhls at t-online.de:

> Otherwise configure issues this error message:
> configure: error: --enable-debug cannot be used in conjunction with --
enable-expert-mode

Hi,

two minutes later the autobuilder found the same error ;)
http://autobuild.buildroot.net/results/b35/b353696a01ae85ad0b0c379364aaa9224e
0bde42/

Regards, Bernd
