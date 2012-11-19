From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 19 Nov 2012 13:23:01 +0000
Subject: [Buildroot] [PATCH] matchbox-lib: Append -lX11 to the linker
In-Reply-To: <CAG2jQ8hyuwRZDJRLF9R5c9KzkEUA2xrU2Rd78h4uAmd3NpEAhg@mail.gmail.com>
References: <1351596554-27077-1-git-send-email-markos.chandras@gmail.com>
 <20121030140043.7ba2722b@skate>
 <CAG2jQ8hieHZUbMXA4pXecX81+hkFermPVYXCggRHhXxz3BYamA@mail.gmail.com>
 <20121030143003.6af62df4@skate>
 <CAG2jQ8hyuwRZDJRLF9R5c9KzkEUA2xrU2Rd78h4uAmd3NpEAhg@mail.gmail.com>
Message-ID: <CAG2jQ8hVCq0pJZf9wYpzyk9CCsNdi2OTtqLGYXWtNKFamr04DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 30, 2012 at 1:53 PM, Markos Chandras
<markos.chandras@gmail.com> wrote:
> On Tue, Oct 30, 2012 at 1:30 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Markos Chandras,
>>
>> On Tue, 30 Oct 2012 13:21:22 +0000, Markos Chandras wrote:
>>
>>> There is no matchbox upstream. Latest release was in 2007 and the
>>> latest post in the mailing list was in 2007 as well.
>>> Their svn repo seems dead too
>>>
>>> http://svn.o-hand.com/view/matchbox/trunk/
>>
>> Hum, right. Do we want to keep those packages in Buildroot then? :-)
>>
>
> Well at least they build now :) There are other alternatives of course
> (openbox, fluxbox) but I think matchbox
> targets different devices (like PDAs or devices with small screens).
> My personal opinion is to keep them
> around until we reach a point where patching them becomes a non-trivial process.
>
> --
> Regards,
> Markos

Hi,

Ping? :)

-- 
Regards,
Markos
