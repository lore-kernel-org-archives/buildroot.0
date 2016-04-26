From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Apr 2016 22:54:00 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
 <20160426223256.0798005b@free-electrons.com>
Message-ID: <8415vcxn9i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 26 Apr 2016 22:32:56 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:
>> The previous commit [ef37472b20894c99cad758397f3cd6b90f933df1] was
>> based on a newer version of Kodi :
>> "with-platform=raspberry-pi2" is not yet supported in Kodi "Jarvis" 
branch.
>> 
>> Backport 2 patches from Kodi master branch into this one.
>> 
>> Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
> 
> Thanks. I do remember seeing a report (on IRC ?) that commit
> ef37472b20894c99cad758397f3cd6b90f933df1 was indeed causing some
> problems.
> 
> Yann, Bernd, can you review/ack this patch from Beno?t?

Hi Thomas,

reviewing it will be difficult for me because I can not do a runtime test 
because I do not have access to RPI hardware.

Currently I am preparing a patch series for the 17.0-Krypton version 
bump, I think I will send the first part of it to my github account in 
the coming days after some of my PR for the Kodi project are completed.

Backporting feature patches is, afair, something you do not really like ;)
As always, as a normal Kodi user, I do not know any release dates but 
17.0-Krypton did not even reach alpha1 yet so expect several months until 
the next version is released. Maybe we should wait for it nonetheless?

Regards, Bernd
