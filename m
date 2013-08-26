From: Rico Bachmann <bachmann@tofwerk.com>
Date: Mon, 26 Aug 2013 10:12:26 +0200
Subject: [Buildroot] [PATCH 0/3] Subversion package and related patches
In-Reply-To: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <000601cea234$010b4d00$0321e700$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

> -----Urspr?ngliche Nachricht-----
> Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Gesendet: Samstag, 24. August 2013 13:08
> An: Buildroot List
> Cc: Rico Bachmann
> Betreff: [PATCH 0/3] Subversion package and related patches
> 
> Hello,
> 
> Here are three patches that add a package for Subversion. I don't need
> it myself, but it was a submission from Rico Bachmann that had been
> waiting since quite some time in our patchwork. I took it, tested it
> and made a few improvements. Some changes in the neon package were
> needed to make it work properly.
> 
> Thanks,
> 
> Thomas
> 
> Rico Bachmann (1):
>   subversion: new package
> 
> Thomas Petazzoni (2):
>   neon: replace 'choice' for XML library with two options
>   neon: factorize 'depends on BR2_PACKAGE_NEON'
> 
>  package/Config.in                |  1 +
>  package/neon/Config.in           | 31 +++++++++----------------------
>  package/rpm/Config.in            |  7 ++-----
>  package/subversion/Config.in     | 11 +++++++++++
>  package/subversion/subversion.mk | 28 ++++++++++++++++++++++++++++
>  5 files changed, 51 insertions(+), 27 deletions(-)  create mode 100644
> package/subversion/Config.in  create mode 100644
> package/subversion/subversion.mk
> 
> --
> 1.8.1.2

thanks a lot for fixing the subversion package. I could not find the time to
finish it.

regards
Rico
