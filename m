From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Apr 2016 23:42:09 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <87wpnzhnwq.fsf@dell.be.48ers.dk>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
 <20160413234135.6bf26795@free-electrons.com>
 <87a8kwio80.fsf@dell.be.48ers.dk> <57100C4A.90903@mind.be>
 <87wpnzhnwq.fsf@dell.be.48ers.dk>
Message-ID: <20160414214209.GC3556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-04-14 23:37 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  > On 04/14/16 10:33, Peter Korsgaard wrote:
>  >> Supporting multiple genimage.cfg files (like we do for device_tables /
>  >> post-build / post-image, ..) IMHO makes sense and looks simple to do.
> 
>  >  Well, compared to the really simple solution that Ezequiel has now, I
>  > think the code will look quite a bit more complicated when there are
>  > multiple genimage.cfg files.
> 
> Wouldn't it basically just sticking the logic in a loop over the words
> in BR2_TARGET_ROOTFS_GENIMAGE_CFG?

It is already possible and perfectly legit to declare more than one
image in a genimage config file, as far as I can see.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
