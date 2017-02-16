From: Sidney Manning <sidneym@codeaurora.org>
Date: Thu, 16 Feb 2017 11:11:06 -0600
Subject: [Buildroot] How to force AUTORECONF for everything
Message-ID: <089f01d28877$aa0cff70$fe26fe50$@codeaurora.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've made a change to libtool which requires that I set PACKAGE_AUTORECONF =
YES to many of the library packages.  Rather than changing each package, I'd
like to force this globally.  Is there a way to do that?

Thanks

Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by
The Linux Foundation
