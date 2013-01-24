From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 24 Jan 2013 13:55:35 +0200
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <5100DE8C.3040203@mind.be>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <20130122180554.6c540102@skate> <50FED7D3.3060600@petroprogram.com>
 <5100DE8C.3040203@mind.be>
Message-ID: <51012137.5060600@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

24.1.2013 9:11, Arnout Vandecappelle kirjoitti:
> On 01/22/13 19:17, Stefan Fr?berg wrote:
> [snip]
>> Here's are the different combinations:
>
>  Excellent explanation! How about adding this to the documentation?
>
>  Regards,
>  Arnout

Well, uh...ok.
But before that I have to finish that <pkg>_CONFIG_FIXUP thing first.
I think ill just make one final, v3 version, of it with fixed doc and
your sed changes
as one single combined patch.
And then Im going to test it one final time before resubmit.


Regards
Stefan
