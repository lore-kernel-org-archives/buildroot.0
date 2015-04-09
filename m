From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu, 9 Apr 2015 08:11:30 -0500
Subject: [Buildroot] [PATCH v5 2/2] i2c-tools: add support to build
	python extension
In-Reply-To: <CA+TH9Vm4xFyS3Wz4TuPVa4zgR+AzTKk3w53EgEjTxEmEyTvUHA@mail.gmail.com>
References: <1428272105-27627-1-git-send-email-ryanbarnett3@gmail.com>
 <1428272105-27627-2-git-send-email-ryanbarnett3@gmail.com>
 <20150406110341.629b5df3@free-electrons.com>
 <20150406090711.GB4369@free.fr>
 <CA+TH9Vm4xFyS3Wz4TuPVa4zgR+AzTKk3w53EgEjTxEmEyTvUHA@mail.gmail.com>
Message-ID: <CALq67GDL-UzMvGBNUTKTCCwvtkaxgWde1fQkfThQrcqN2yDkAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, Apr 9, 2015 at 1:32 AM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Dear Ryan Barnett, Yann E. MORIN, Thomas Petazzoni,
>
>>> Applied. Did you check that i2c-tools python support was Python 2 only?
>>> Or does it also support Python 3 ?
>>
>> Yes, it is Python-2 only (see the v1->v2 changelog in the commit notes).
>
> This is not true! Py-smbus supports python 3, se the commit here for
> further reference:
>
> http://www.lm-sensors.org/changeset/6267

When I tried to compile for Python 3 - I had many errors about not
finding Python3 functions. I would image that was probably due to the
fact that the include paths weren't correct. However, at that time I
had lost interest.

Please feel free to add support for Python 3 for py-smbus (i2c-tools).
Will be sure to review and test it.

Thanks,
-Ryan
