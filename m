From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 16 Nov 2013 16:07:43 +0100
Subject: [Buildroot] longterm kernel releases: version-URI different for
 v2.x kernels
In-Reply-To: <20131116113842.1c01a56d@skate>
References: <76128FA7-9969-4BC7-B8F8-07F5BEDDD177@ipfabrics.com>
 <20131116113842.1c01a56d@skate>
Message-ID: <CAAXf6LXEcnwF0N2Fq-tOD+_JY23LNWWZAygkB-ywf4_GiUOi6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Rick,

On Sat, Nov 16, 2013 at 11:38 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Rick Robino,
>
> On Fri, 15 Nov 2013 23:53:40 -0800, Rick Robino wrote:
>
>> I encountered problems automatically downloading kernel version
>> 2.6.32.61, one of the current longterm releases.  It looks like the
>> URL might have changed, so I thought that I would mention it here in
>> case this fact might be news to anyone.
>>
>> The longterm kernels are in a subdirectory called
>> ?v2/.6/longterm/vA.B.C?.  Buildroot only looks in ?v2.6?, which works
>> fine for standard kernels but not the longterm ones for 2.6.
>
> Yes. Buildroot cannot guess if the kernel version you're using is a
> "normal" version or a "longterm" version. Therefore, when you choose to
> only give the kernel version in the configuration, it only looks in
> 2.6/ or 3.x/. If you need a kernel version that is available in some
> other location, then you should use the "Custom tarball" configuration
> choice, which allows you to pass an arbitrary URL to a tarball,
> either located on kernel.org or on some other place.

This same question popped up a while back as well, maybe we should add
this catch in the help text of one of the linux options...

Best regards,
Thomas
