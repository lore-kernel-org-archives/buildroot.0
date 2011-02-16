From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 16 Feb 2011 16:15:39 +0100
Subject: [Buildroot] [PATCH] Makefile: improve $(TARGET_DIR) (re)creation
In-Reply-To: <AANLkTim9oR5GthXJcfJsi70qNfZEX3gXDNVOAx+ptq-F@mail.gmail.com>
References: <1297627745-17087-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi==jLjhNbswUC1wsgUySjB_kM_7VD1Ns9mQoMsE@mail.gmail.com>
	<AANLkTikvPodMe8ZGmo452Zn_hBU5c2S=2RpMNYKOoMAP@mail.gmail.com>
	<AANLkTi=jtfZmP=BqvhxoQxLLRyFpj0p3=Z_b0WguBu_y@mail.gmail.com>
	<AANLkTim9oR5GthXJcfJsi70qNfZEX3gXDNVOAx+ptq-F@mail.gmail.com>
Message-ID: <AANLkTinnMpcWpDiHVyPyQTP8AdhEEy9f+aegCsoUhCWH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/16 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> 2011/2/16 Bj?rn Forsman <bjorn.forsman@gmail.com>
>>
>> On 15 February 2011 13:10, Daniel Nystr?m
>> <daniel.nystrom@timeterminal.se> wrote:
>> > 2011/2/15 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> >> 2011/2/13 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> >>> With this patch, just remove $(TARGET_DIR) and Buildroot will recreate
>> >>> it.
>
> [snip]
>>
>> >
>> > I'm afraid I can't say anything about this particular approach (I
>> > don't even have time to test it right now) but I do would love a way
>> > to regenerate the target dir.
>>
>> It's good to know I'm not the only one wanting this :-)
>
> Actually, there has been a few request of such feature just recently on the
> Freenode IRC channel.
>
> One great step would be to remove all "compiled" and "installed" stamps and
> let every package get rebuilt (if necessary!) and reinstalled. In that case,
> testing minor changes to single packages would be a quick job. Not an
> half-hour job as of today.
>
> I think there is work going on to add a step when installing packages, where
> it would first be turned into a tarball and later on extracted upon the
> target root fs. But I havn't heard anything about it for months.
>

(sorry if last message got send as html)
