From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Jan 2018 11:06:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-xlib: new package
In-Reply-To: <CAMWSM7jG_EYigcbzNTKPyO9+VU+rFiW6XPhMKCMiFXK6pkEw_Q@mail.gmail.com>
References: <20180105000420.20152-1-joseph.kogut@gmail.com>
 <20180105211307.25071-1-joseph.kogut@gmail.com>
 <20180106151308.7b5765f7@windsurf>
 <CAMWSM7jG_EYigcbzNTKPyO9+VU+rFiW6XPhMKCMiFXK6pkEw_Q@mail.gmail.com>
Message-ID: <CAGm1_ksR1uvjaj5fdYmKjPuaUL1gjJ9Az5xCB2MpyOvOFU89aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On Sun, Jan 7, 2018 at 3:48 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Hello,
>
> On Sat, Jan 6, 2018 at 6:13 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> This personal message and changelog should have gone...
>>
>>>
>>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>>> ---
>>
>> ... here, so that Git doesn't include it as part of the commit log.
>> Indeed, we don't need to keep such details in the Git history (but they
>> are very useful to have during the patch review process).
>>
>>> +PYTHON_XLIB_VERSION = 0.21
>>> +PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
>>> +PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
>>> +PYTHON_XLIB_SETUP_TYPE = setuptools
>>> +PYTHON_XLIB_LICENSE = LGPL-2.0+
>>
>> The license is in fact LGPL-2.1+, so I've fixed that and applied your
>> patch to the master branch.
>
> Ah, thanks for the fixup. I'll keep that in mind next time.
>
>> Thanks for your contribution!
>
> Thanks for all your support!

Btw. have you ever tried utils/scanpypi (see "17.8.3. Generating a
python-package from a PyPI repository" for the reference)?

Yegor
