From: Martin Banky <Martin.Banky@gmail.com>
Date: Sun, 19 Sep 2010 10:05:42 -0700
Subject: [Buildroot] [PATCH 21/21] BugFix - m4 - Fixed Missing wint_t
 typedef When There Is No WChar Support
In-Reply-To: <4C95DEB4.9010700@googlemail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
	<1284864823-18993-22-git-send-email-Martin.Banky@gmail.com>
	<4C95DEB4.9010700@googlemail.com>
Message-ID: <AANLkTikbtHTJHrtARu3B136385MXrzFOPP80ZGOeztOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,
     It is on my todo list.

Martin

On Sun, Sep 19, 2010 at 2:58 AM, Marcus Osdoba <marcus.osdoba@googlemail.com
> wrote:

>  Am 19.09.2010 04:53, schrieb Martin Banky:
>
>  When uClibc is configured without wchar support, wint_t does not get
>> defined.
>>
>> Signed-off-by: Martin Banky<Martin.Banky@gmail.com>
>> ---
>>
> Hi Martin,
>
> These are just my comments on m4.
>
> I figured out, that the m4 package is rather old. Maybe it is better to
> migrate to a newer version. I had a look into the recent one and read wchar
> everywhere....
> So I guess the new version will be dependant from WCHAR in any case.
>
> I don't know if it's better to
> - upgrade to new version
> - make currently integrated one dependant from WCHAR
> - include your patch and keep currently integrated version
>
> Regards,
> Marcus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100919/cb980c0f/attachment.html>
