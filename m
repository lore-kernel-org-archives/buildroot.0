From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 14:29:45 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <28c618b1c91a0df16af32645666e7198@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
 <20161118124008.2b7a3178@free-electrons.com>
 <28c618b1c91a0df16af32645666e7198@sysmic.org>
Message-ID: <20161118142945.60adccd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 14:02:58 +0100, J?r?me Pouiller wrote:

> My workstation only have tar 1.27 installed. When tar version is wrong, 
> compilation does not fail. Instead, host-tar is compiled before any
> other packages (see support/dependencies/check-host-tar.mk)

Yes, I know, but it's a pain to force everyone using an old distro to
build host-tar. Maybe we should make this conditional on
BR2_REPRODUCIBLE?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
