From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jun 2014 10:11:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Depends on
	host-xfont_font-util
References: <1402524987-24727-1-git-send-email-bernd.kuhls@t-online.de>
 <20140612091745.73abc72f@free-electrons.com>
Message-ID: <XnsA34A67B1ACD9CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140612091745.73abc72f at free-electrons.com: 

> Isn't the problem you're seeing related to a local change you've made
> to the X.org server package?

Hi,

oops, right. It is needed for the fix-parallel-man-page-build patch, I merged 
both patches and sent v3: http://patchwork.ozlabs.org/patch/359030/

Regards, Bernd
