From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 10 Sep 2015 16:30:47 +0200
Subject: [Buildroot] [RFC] Add pyudev package
In-Reply-To: <20150910143930.00227183@free-electrons.com>
References: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
 <20150910143930.00227183@free-electrons.com>
Message-ID: <CAGm1_kvo5wPvVgxSjK+CG7QGmMsdP-eNqNAwhOs+Q6B2QsXekA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 10, 2015 at 2:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear yegorslists at googlemail.com,
>
> On Thu, 10 Sep 2015 12:33:51 +0200, yegorslists at googlemail.com wrote:
>> This package provides Python bindings for udev. The package can be successfully
>> installed, but it fails to find libudev via find_library(). See [1] for details.
>> I have even tried to install binutils, but it fails anyway.
>>
>> This issue is quite old [2], but so far there is no official solution.
>
> I haven't looked in detail, but isn't the solution to patch the Python
> find_library() function to make it not rely on gcc/objdump?

It would be the best solution. Have you seen such a patch in the wild?
So far there was not much feedback in Python's bug tracker.

Yegor
