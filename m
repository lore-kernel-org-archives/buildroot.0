From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Tue, 17 Sep 2013 15:53:31 -0700
Subject: [Buildroot] Building pyzmq
In-Reply-To: <CALoHCLO8aLfvdYxGhhsMoGao9a_nYdBZYcjqxr6x0bKxQG1d1Q@mail.gmail.com>
References: <CALoHCLNrOptvEKwsErhHS8go9M-UB=H=9MPGzvXcqpFP4xeMmA@mail.gmail.com>
 <F41243CA-E279-40E7-A6BE-9B8441CBE297@layer-7.net>
 <CALoHCLO8aLfvdYxGhhsMoGao9a_nYdBZYcjqxr6x0bKxQG1d1Q@mail.gmail.com>
Message-ID: <CALoHCLMJRz6ib1h8tvDUn3kPiq7AGWHm3pu7FB8oTwzF1SwdPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested the newest patch. Seems okay to me, was able to build and run
on the target.

Thanks Again,
Eric Seifert

On Tue, Sep 17, 2013 at 2:48 PM, Eric Seifert <eric.seifert@cyaninc.com> wrote:
> Hi Michael, I tested your last patch (sent on Sept 1) and that one
> seemed to work. I will test this one now.
>
> Thanks,
> Eric Seifert
>
> On Sat, Sep 14, 2013 at 7:46 AM, Michael Rommel <rommel@layer-7.net> wrote:
>>
>> Hi Eric,
>>
>> I believe the last version of my patch for python-pyzmq addresses the error.
>> I sent it to the mailinglist a few minutes ago.
>>
>> If you can test it, I'll be glad to hear your feedback.
>>
>>   Michael.
>>
>> --
>> Michael Rommel, Erlangen, Germany
>>
>> On Aug 29, 2013, at 22:35 , Eric Seifert <eric.seifert@cyaninc.com> wrote:
>>
>>> Hello, I am using ZeroMQ and need to build the python bindings for it.
>>> I added a python-pyzmq package for it and am having some compilation
>>> errors. The package is python but has a native extension, so is
>>> compiled.
