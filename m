From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Tue, 03 Dec 2013 08:59:59 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <529D0408.5020306@mind.be>
References: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
 <1385384136-22652-2-git-send-email-rebillout@syscom.ch>
 <52939017.20203@mind.be> <529C54A1.3050805@syscom.ch>
 <529D0408.5020306@mind.be>
Message-ID: <529D8F7F.2020009@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2013 11:04 PM, Arnout Vandecappelle wrote:
> On 02/12/13 10:36, Arnaud R?billout wrote:
>> Hello Arnout,
>>
>> On 11/25/2013 06:59 PM, Arnout Vandecappelle wrote:
>>> On 25/11/13 13:55, Arnaud R?billout wrote:
> [snip]
>>
>> In the Config file I offer the choice to disable/enable everything just
>> for the sake of offering every option possible, but I agree that some
>> options may be useless.
>> For example, cmd-sleep doesn't save much space, compared to the total
>> size of lftp.
>
>  If you feel like removing the options that don't make much of a 
> difference, please do. But otherwise, you can just leave things as is.
OK, personnally I prefer to let every option visible, so that people may 
decide by themselves whether it's useful.

>
>>
>> Tell me what you prefer about that. Also, if you prefer to present the
>> options in a sub-menu instead of the main menu, or if you think a 
>> default
>> setting should be set (like enabling ftp by defaut, because the name 
>> lftp
>> suggests that it deals with ftp...).
>
>  Personally I don't like submenus, but we do have them for some 
> packages. So: choose whatever you prefer.
>
>  Enabling ftp by default makes sense but again is not strictly necessary.
Ok, I'll keep the same presentation.

>
>  Your other replies were satisfactory, so after squashing the two 
> patches you'll probably get my Acked-by.
>
Great ! Thanks a lot for taking time to review !


Best regards,
Arnaud


-- 
Arnaud R?billout
/D?veloppeur software/

SYSCOM Instruments SA,
Rue de l?Industrie 21,
1450 Ste-Croix, SUISSE
Tel : +41 (0) 24 455 44 11
Fax : +41 (0) 24 454 45 60
Visit us at www.syscom.ch <http://www.syscom.ch>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131203/1f41fc47/attachment.html>
