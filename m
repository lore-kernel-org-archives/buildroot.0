From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 14 Jan 2018 21:34:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-xlib: new package
In-Reply-To: <CAMWSM7j=7peQ8SA_2OkuyLSZY3REme2Zcr8axnF4vYVsp7WnUA@mail.gmail.com>
References: <20180105000420.20152-1-joseph.kogut@gmail.com>
 <20180105211307.25071-1-joseph.kogut@gmail.com>
 <20180106151308.7b5765f7@windsurf>
 <CAMWSM7jG_EYigcbzNTKPyO9+VU+rFiW6XPhMKCMiFXK6pkEw_Q@mail.gmail.com>
 <CAGm1_ksR1uvjaj5fdYmKjPuaUL1gjJ9Az5xCB2MpyOvOFU89aA@mail.gmail.com>
 <CAMWSM7j=7peQ8SA_2OkuyLSZY3REme2Zcr8axnF4vYVsp7WnUA@mail.gmail.com>
Message-ID: <CAGm1_ksiLUagAoO-GDg+2u1Gt__2znck3XTUwHaaBNRq=YHoLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 14, 2018 at 9:28 PM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Hi Yegor,
>
> On Sun, Jan 7, 2018 at 2:06 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> Hello Joseph,
>>
>> On Sun, Jan 7, 2018 at 3:48 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
>>> Hello,
>>>
>>> On Sat, Jan 6, 2018 at 6:13 AM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>
>>>> This personal message and changelog should have gone...
>>>>
>>>>>
>>>>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>>>>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>>>>> ---
>>>>
>>>> ... here, so that Git doesn't include it as part of the commit log.
>>>> Indeed, we don't need to keep such details in the Git history (but they
>>>> are very useful to have during the patch review process).
>>>>
>>>>> +PYTHON_XLIB_VERSION = 0.21
>>>>> +PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
>>>>> +PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
>>>>> +PYTHON_XLIB_SETUP_TYPE = setuptools
>>>>> +PYTHON_XLIB_LICENSE = LGPL-2.0+
>>>>
>>>> The license is in fact LGPL-2.1+, so I've fixed that and applied your
>>>> patch to the master branch.
>>>
>>> Ah, thanks for the fixup. I'll keep that in mind next time.
>>>
>>>> Thanks for your contribution!
>>>
>>> Thanks for all your support!
>>
>> Btw. have you ever tried utils/scanpypi (see "17.8.3. Generating a
>> python-package from a PyPI repository" for the reference)?
>>
>> Yegor
>
> I have, but I've had issues with using the tool for certain packages.
> Practically speaking the correct course of action would probably be
> for me to submit patches to improve the tool, rather than not use it.
> Clearly, I made some mistakes with this submission as a result.

scanpypi still has problems with some odd setup.py files, but the most
packages can be handled without fuss. And patches are always welcome
:-)

Yegor
