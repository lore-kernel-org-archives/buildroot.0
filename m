From: Andreas Ehmanns <universeii@gmx.de>
Date: Wed, 6 Jul 2016 18:47:11 +0200
Subject: [Buildroot] [PATCH 4/4] Package netsnmp: Added OK/FAIL output
In-Reply-To: <20160701150415.515459b2@free-electrons.com>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <1456435484-4723-4-git-send-email-universeII@gmx.de>
 <20160701123644.GB25487@free.fr> <20160701150415.515459b2@free-electrons.com>
Message-ID: <577D360F.5090606@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Yann, all,
thanks for revising the patch series and for incorporating the changes 
into buildroot.

Regards,
Andreas


Am 01.07.2016 um 15:04 schrieb Thomas Petazzoni:
> Hello,
>
> On Fri, 1 Jul 2016 14:36:44 +0200, Yann E. MORIN wrote:
>
>>> @@ -92,6 +98,7 @@ case "$1" in
>>>       reload|force-reload)
>>>           reload
>>>           ;;
>>> +
>> Spurious empty line.
> It's indeed not strictly related, but in all other cases of this
> switch, there is an empty line separating cases. So I think it's good
> to also have this one for consistency. It could have been in a separate
> commit, but oh well, that was good enough.
>
> Thanks for the review!
>
> Thomas
