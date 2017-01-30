From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 30 Jan 2017 11:28:14 +0100
Subject: [Buildroot] [PATCH v5 08/10] python-pyqt5: Depend directly on
 Qt5 rather than its toolchain requirements
In-Reply-To: <20170130101130.3ed6e634@free-electrons.com>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
 <20170127212120.04eaddfe@free-electrons.com>
 <9311d4db-5c83-2dfe-48d7-9cd9ded1af28@andin.de>
 <20170130101130.3ed6e634@free-electrons.com>
Message-ID: <549177e2-62e6-333a-79b6-58f26a87157e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Andreas & All,

I'm gonna try to take this over from Andreas. As not all of the patches
apply clean atm (because of the recent example code license related
patchset), i'm going to fix that, do some testing (which will take some
time given the compilation times), and submit a v6 of this set, also
adding the proposed comment for python-qt5. (Unless of course someone is
working on this already, in this case pls let me know so we can share
the  tasks)

Regards,

Zoltan Gyarmati
https://zgyarmati.de

On 01/30/2017 10:11 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 27 Jan 2017 15:20:31 +0100, Andreas Naumann wrote:
>
>> That would be your comment in v3 of this set:
>>
>> "When you want python-qt5 it's really obvious that you need
>> Qt5, so for the user it's logical to enable Qt5 and then Python-Qt5."
> Sure. What I meant is that such explanation should be part of the
> commit log. This way, if a few months/years from now we wonder why this
> change was done, we have the explanation in the commit log.
>
>> Unfortunately, I wont have time to rework this and your other two 
>> comments in the next 10 days. If you need to apply the set earlier than 
>> that, feel free to just change as needed.
> Sure, thanks!
>
> Thomas


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170130/2e98912a/attachment.asc>
