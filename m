From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 14 May 2014 06:53:37 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: Remove ldconfig calls
References: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
 <20140513233817.3fed1500@free-electrons.com>
Message-ID: <hf9b4bxkkp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140513233817.3fed1500 at free-electrons.com: 

> Do you think and upstreamable version of this patch is possible?

Hi,

as this is a libtool issue I think not. But I reworked the patch in a way a 
separate patch file is not needed anymore: 

http://patchwork.ozlabs.org/patch/348586/

Similar patches can be found all over the tree, for example in zlib, luajit, 
wireless_tools.

Regards, Bernd
