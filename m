From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 2 Sep 2008 19:29:54 +0800
Subject: [Buildroot] Still "Can't open /dev/tty1[2,3]", Please HELP
In-Reply-To: <ed4892840809020327s1f9447e4g4cf60ce2920d2e10@mail.gmail.com>
References: <ed4892840809011839w2b021ec5v26159eefa8389e41@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBEEIHCBAA.e.krueper@solcon-systemtechnik.de>
	<ed4892840809020327s1f9447e4g4cf60ce2920d2e10@mail.gmail.com>
Message-ID: <ed4892840809020429r476a112fga1b48b3ceff6dfa9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2008 at 6:27 PM, Steven Woody <narkewoody@gmail.com> wrote:
> On Tue, Sep 2, 2008 at 2:24 PM, Emil Kruper
> <e.krueper@solcon-systemtechnik.de> wrote:
>>>But I still like to know what you mentioned 'device table'. I want to
>>>ask, what is and where is the 'device table'?  I dont find the
>>>concepts in buildroot on-line doucments.  Thanks.
>>
>> Have a look at target/generic/device_table.txt and
>> target/generic/mini_device_table.txt.
>
> sorry for the stupid ... I append the exact file with the folllowing line
>  /usr/local              d       755     0       0       -       -
>   -       -       -
> to ensure the target/generic/device_table.txt really works.  But after
> full build, I don't find /usr/local under the root. So,,,  what
> 'device_table.txt' should I go to use?
>
>> You define by the buildroot config which file is used to generate the
>> targets device table.
>
> Where is the definition for the target device table file name?  Thanks.
>


sorry, Emil, for this problem,  I found what mattered is
target/generaic/mini_device_table.txt instead of
target/generic/device_table.txt.   Please focus on my another thread
and be kindly to help me resolve the "can not login" or "getty exited"
problem.  Thanks.
