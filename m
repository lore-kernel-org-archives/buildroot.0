From: Uwe Strempel <u.strempel@googlemail.com>
Date: Sun, 2 Feb 2014 13:13:11 +0100
Subject: [Buildroot] Patch for toolchainfile.cmake absolut path
	references
In-Reply-To: <CAHXCMM+3EFDcnL-K5FzuDw1Xs-eThD_yJ4rEP1L7HopmqhMpug@mail.gmail.com>
References: <52ECDB01.5070306@googlemail.com>
 <CAHXCMM+3EFDcnL-K5FzuDw1Xs-eThD_yJ4rEP1L7HopmqhMpug@mail.gmail.com>
Message-ID: <CAAuo+=LDDYQ_YLYr12S=qdFhj1FRMbma1H98CSuSUVCKeyrwxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
> The idea of what has to be done in the toolchainfile.cmake is good,
though I think you miss some $-escaping...
Ok I fix the patch :/.
>
http://www.buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
),
I didn't know how to contribute the right the way.
But for the next patches I will do it the right way.

Thanks!
Regards,
Uwe

2014-02-02 Samuel Martin <s.martin49@gmail.com>:

> Hi Uwe,
>
> On Sat, Feb 1, 2014 at 12:31 PM, Uwe Strempel <u.strempel@googlemail.com>wrote:
>
>> Hi,
>> I've build a patch for BUG #6818
>>
>> FIrst, thanks for your contribution, but please consider a patch using
> git,
> and send it to the mailing list using 'git send-email' (see
>
> http://www.buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
> ),
> this is the way Buildroot community works.
>
> Anyway, I looked at the patch.
>
>
>> On build process of buildroot the toolchainfile.cmake is created, but
>> with wrong absolut path.
>> When shareing the toolchain or move the folder you get problems this
>> path settings.
>>
>> A workarround for cmake files is
>> - get the path of the toolchainfile.cmake and set the the variables.
>>
>>
> I found the part touching the package/Makefile.in a bit confusing.
> The idea of what has to be done in the toolchainfile.cmake is good, though
> I think you miss some $-escaping...
>
>
> Regards,
>
> --
> Samuel
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140202/5f89f533/attachment.html>
