From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 4 May 2017 13:27:14 -0700
Subject: [Buildroot] [PATCH v2 05/10] package/python-scandir: New package
In-Reply-To: <20170504221841.0eb0f3a6@free-electrons.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
 <20170427213340.26917-6-andrew.smirnov@gmail.com>
 <20170504221841.0eb0f3a6@free-electrons.com>
Message-ID: <CAHQ1cqEif2ED=vuWishBBqcc9a4Evdfb7dKYYhqAyXBWgB-Q=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 4, 2017 at 1:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 27 Apr 2017 14:33:35 -0700, Andrey Smirnov wrote:
>
>> +config BR2_PACKAGE_PYTHON_SCANDIR
>> +     bool "python-scandir"
>> +     help
>> +       A configuration system for Python applications.
>
> This description is bogus.
>
>> +       https://pypi.python.org/pypi/pickleshare
>
> This URL is wrong.
>
> And the entry to DEVELOPERS file is missing.
>
> Could you please check your entire series, and verify all those
> details? Once they are all fixed, could you resubmit an updated version?

Sorry about that, my bad. I'll re-check the series and submit v3.

>
> Please verify the dependencies and licenses as well.

Will do.

Thanks,
Andrey Smirnov
