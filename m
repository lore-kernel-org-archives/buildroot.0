From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 08:45:00 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <20160414214209.GC3556@free.fr> (Yann E. MORIN's message of "Thu, 
 14 Apr 2016 23:42:09 +0200")
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
 <20160413234135.6bf26795@free-electrons.com>
 <87a8kwio80.fsf@dell.be.48ers.dk> <57100C4A.90903@mind.be>
 <87wpnzhnwq.fsf@dell.be.48ers.dk> <20160414214209.GC3556@free.fr>
Message-ID: <87shyngykz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Wouldn't it basically just sticking the logic in a loop over the words
 >> in BR2_TARGET_ROOTFS_GENIMAGE_CFG?

 > It is already possible and perfectly legit to declare more than one
 > image in a genimage config file, as far as I can see.

Ahh, so we can then just concatenate all files specified and pass to
genimage - Nice!

-- 
Venlig hilsen,
Peter Korsgaard 
