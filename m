From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 03 Jan 2011 22:17:01 +0100
Subject: [Buildroot] [PATCH] New package to do a complete build for the
 seagate dockstar hardware.
In-Reply-To: <463009.12885.qm@web58207.mail.re3.yahoo.com>
References: <1292301534-3059-1-git-send-email-nospamcalfee@yahoo.com>
	<705612.60084.qm@web58201.mail.re3.yahoo.com>
	<4D12708D.3060901@googlemail.com>
	<463009.12885.qm@web58207.mail.re3.yahoo.com>
Message-ID: <4D223CCD.3040801@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 23.12.2010 19:10, schrieb Steve Calfee:
>
>
> ----- Original Message ----
>
>> From: Marcus Osdoba<marcus.osdoba@googlemail.com>
>> To: buildroot at busybox.net
>> Sent: Wed, December 22, 2010 1:41:33 PM
>> Subject: Re: [Buildroot] [PATCH] New package to do a complete build for the
>> seagate dockstar hardware.
>>
>> Am 14.12.2010 19:07, schrieb Steve Calfee:
>>> I tried to send this to the  list using git send-email using the tips on how
>> to
>>> send via my gmail  account. The list manager bounced the email because that
>> email
>>>
>>>   address is not used for buildroot. How do others send to the mailing list?
>> Is
>>> there a way to send via the yahoo mail system from git  send-email?
>> I use googlemail and my git conf looks like  this:
>> [user]
>>          name = XXX YYY
>>           email = XXX.YYY at googlemail.com
>> [sendemail]
>>           smtpencryption = tls
>>           smtpserver = smtp.gmail.com
>>           smtpuser = XXX.YYY at gmail.com
>>           smtpserverport = 587
>>          from = XXX YYY<xxx.yyy@googlemail.com>
>> [format]
>>           numbered = auto
>>          to = buildroot at busybox.net
>>           signoff = true
>> The smtp password is asked on any "git  send-patch".
>
> Hi Marcus,
>
> What does the "from =" do? Is it like sendmail and allow sender spoofing (or
> sender aliasing or whatever they call it)?
That's the typical from-line which could be configured in every other 
email client, too.
> My problem is I have both gmail and yahoo email accounts. I use yahoo to read
> the buildroot mailing list, so I am registered with buildroot on my yahoo
> account. When I did "git send-email" I did like you have above, but had my email
> = line as the yahoo account, but the rest for gmail so I could send the git
> patch. The buildroot mailing list detected that I sent from gmail and
> spam-blocked the send.
>
> So is my only solution to register with buildroot via my gmail account?
I guess, that would work.

P.S.: Happy new year ;-)
