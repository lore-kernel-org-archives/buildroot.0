From: =?UTF-8?Q?Beno=c3=aet_Mauduit?= <bmauduit@beneth.fr>
Date: Wed, 27 Apr 2016 11:08:56 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <8415vcxn9i.ln2@ID-313208.user.individual.net>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
 <20160426223256.0798005b@free-electrons.com>
 <8415vcxn9i.ln2@ID-313208.user.individual.net>
Message-ID: <572081A8.7060506@beneth.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 04/26/2016 10:54 PM, Bernd Kuhls wrote:
> Am Tue, 26 Apr 2016 22:32:56 +0200 schrieb Thomas Petazzoni:
> 
>> Hello,
>>
>> On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:
>>> The previous commit [ef37472b20894c99cad758397f3cd6b90f933df1] was
>>> based on a newer version of Kodi :
>>> "with-platform=raspberry-pi2" is not yet supported in Kodi "Jarvis" 
> branch.
>>>
>>> Backport 2 patches from Kodi master branch into this one.
>>>
>>> Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
>>
>> Thanks. I do remember seeing a report (on IRC ?) that commit
>> ef37472b20894c99cad758397f3cd6b90f933df1 was indeed causing some
>> problems.
>>
>> Yann, Bernd, can you review/ack this patch from Beno?t?
> 
> Hi Thomas,
> 
> reviewing it will be difficult for me because I can not do a runtime test 
> because I do not have access to RPI hardware.
> 
> Currently I am preparing a patch series for the 17.0-Krypton version 
> bump, I think I will send the first part of it to my github account in 
> the coming days after some of my PR for the Kodi project are completed.
> 
> Backporting feature patches is, afair, something you do not really like ;)
> As always, as a normal Kodi user, I do not know any release dates but 
> 17.0-Krypton did not even reach alpha1 yet so expect several months until 
> the next version is released. Maybe we should wait for it nonetheless?

Sorry to ask this, but do you have an explanation about not taking
upstream patches ? It is not obvious for me.

Also, I began to implement this fix on my own, and after seeing that
master branch have implemented this, I thought that it would better to
backport it. (Plus some addition from my side, that I will try to report
upstream).

From my point of view, we can integrate this patch (affecting only
raspberry-pi2 build) and remove it when the newer version of Kodi will
integrate it ?

Anyway, thanks for your feedbacks !
Regards,

Ps: I have tested Kodi on my raspberry-pi2. It works like a charm :)

-- 
Beno?t Mauduit
Mail : <bmauduit@beneth.fr>
XMPP : <bmauduit@im.beneth.fr>
