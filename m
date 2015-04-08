From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 08 Apr 2015 22:37:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Remove unused dependency
	to libungif
References: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
 <1428524507-30375-2-git-send-email-bernd.kuhls@t-online.de>
 <20150408223335.7622520e@free-electrons.com>
Message-ID: <XnsA476E62EC7E96berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150408223335.7622520e at free-electrons.com:

> With this, the latest user of libungif is gone, so can you send a patch
> to deprecate the libungif package? I believe it was the overall goal of
> moving to giflib, right?

Hi,

done: http://patchwork.ozlabs.org/patch/459488/

Yes, Kodi 15.0 will drop the dependency to SDL and will use libjpg/png/gif 
(not libungif) instead in the texturepacker host binary.

Regards, Bernd
