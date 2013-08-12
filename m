From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 12 Aug 2013 15:08:10 +0100
Subject: [Buildroot] Does MIP64 ABI 64 support dynamic linking?
In-Reply-To: <D4B053F823DA904C8FD129217ABE432D0312F8418262@fs28.airspan.com>
References: <D4B053F823DA904C8FD129217ABE432D02E4B147C47B@fs28.airspan.com>
 <CAG2jQ8iJ8PxUOrQbiWCuOgptHFq+A7LYVGuO9C+B9P=+MGajXw@mail.gmail.com>
 <D4B053F823DA904C8FD129217ABE432D0312F8418262@fs28.airspan.com>
Message-ID: <CAG2jQ8ixyQGNWv6SS1yoCe1gJ6YW_62cuHz3Co5_5S3v6ovL9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 June 2013 16:18, Michael Feldman <mfeldman@airspan.com> wrote:
> Hello Markos,
>
> I abandoned this activity for a while after some unsuccessful tries, since I got other more urgent tasks.
> So, unfortunately, I cannot help.
>
> BR,
> Michael
>
> -----Original Message-----
> From: Markos Chandras [mailto:markos.chandras at gmail.com]
> Sent: Tuesday, June 18, 2013 5:05 PM
> To: Michael Feldman
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Does MIP64 ABI 64 support dynamic linking?
>
> On 30 April 2013 19:55, Michael Feldman <mfeldman@airspan.com> wrote:
>> Hello,
>>
>>
>>
>> I built a buildroot MIPS64 BE rootfs for my XLP-based custom board
>> (running currently an angstrom-based distribution built with
>> gcc-4.4.5) using last version of buildroot.
>>
>>...
>> Has anybody faced this problem and has a hint how to solve it?
>
> Hi Michael,
>
> I believe I've seen this problem once in the past. I did the same thing like you did. Build a static busybox.
>
> I was wondering if you've managed to debug this problem.
>
> --
> Regards,
> Markos Chandras

Hi Michael,

This should now be fixed after the recent uclibc patches for MIPS64/n64

-- 
Regards,
Markos Chandras
