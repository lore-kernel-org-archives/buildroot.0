From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 12:25:18 +0200
Subject: [Buildroot] Trouble building the manual
In-Reply-To: <20131009111405.0ca6bcf3@skate>
References: <10469D7B3F0C4FA0BDDC951C132C8F83@JohanW7>
 <20131009111405.0ca6bcf3@skate>
Message-ID: <CAAXf6LWaycEOPwTHELNKiq1E_Sm5gUukkgo0A5FY0Hj5qdxxNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 9, 2013 at 11:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sagaert Johan,
>
> On Wed, 9 Oct 2013 11:04:16 +0200, Sagaert Johan wrote:
>
>> # make manual-pdf
>> >>>   Updating the manual lists...
>> Traceback (most recent call last):
>>   File "/home/buildroot12git/support/scripts/gen-manual-lists.py", line 41, in <module>
>>     from argparse import ArgumentParser
>> ImportError: No module named argparse
>> make: *** [manual-update-lists] Error 1
>
> You need the Python argparse module. In recent versions of Python, it's
> part of the standard library. With older versions, you need to install
> separately.
>
> Check if your distribution has a package called python-argparse or
> something like that.
>

Note that this would have been caught with the proposed dependency check
(http://patchwork.ozlabs.org/patch/280931/)

Best regards,
Thomas
