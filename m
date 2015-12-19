From: hong zhang <henryzhang62@yahoo.com>
Date: Sat, 19 Dec 2015 17:17:18 +0000 (UTC)
Subject: [Buildroot] add user script to /etc/rc before rootfs is created
In-Reply-To: <20151218223234.GB10982@free.fr>
References: <20151218223234.GB10982@free.fr>
Message-ID: <1459995397.883814.1450545438212.JavaMail.yahoo@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
I want to create subdirectory where all USER APIs will sit.Is this guide to follow ashttps://buildroot.org/downloads/manual/manual.html#_quick_guide_to_storing_your_project_specific_customizations

Any link to specific sample I can reference?
---henry 

    On Friday, December 18, 2015 2:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
 

 Henry, all,

On 2015-12-18 21:58 +0000, hong zhang spake thusly:
> List,
> I add user script to /etc/rc/... so that the script can be executed right after kernel is up.
> What I am doing now is:
> After building first rootfs, expand rootfs and add my script to /etc/rc... area.
> Is it possible to add my script to buildroot before rootfs is created?

Yes, this is covered in the manual, see;
? ? https://buildroot.org/downloads/manual/manual.html#rootfs-custom

Regards,
Yann E. MORIN.

> ---henry

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? |? ___? ? ? ? ? ? ? |
| +33 223 225 172 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? v? conspiracy.? |
'------------------------------^-------^------------------^--------------------'


  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151219/8c2edc11/attachment.html>
