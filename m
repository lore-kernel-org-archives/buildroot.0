From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 3 Jan 2017 09:49:18 +0100
Subject: [Buildroot] [PATCH v2] python-arrow: new package
In-Reply-To: <CAJeZidJWZyxM3LkatKREnk11R0JfoWXXsQ+isGS5QyiCL+6tow@mail.gmail.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
 <1483371929-13907-3-git-send-email-david.bachelart@bbright.com>
 <CAGm1_ktQ+4FQPJznSSKyXsq5Oa_M7Q6OwJMHJucXpBAr_FbKZw@mail.gmail.com>
 <CAJeZidJWZyxM3LkatKREnk11R0JfoWXXsQ+isGS5QyiCL+6tow@mail.gmail.com>
Message-ID: <CAGm1_kvGo5ALF0yLT+qu8vi4tQC7DRDXJ=L3Fmg+xOh_41YNHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Tue, Jan 3, 2017 at 9:40 AM, David Bachelart
<david.bachelart@bbright.com> wrote:
> Hi Yegor,
>
> 2017-01-02 20:58 GMT+01:00 Yegor Yefremov <yegorslists@googlemail.com>:
>>
>> python-dateutil is a runtime dependency, so remove it. Btw have tried
>> our "./support/scripts/scanpypi arrow" to add this package?
>
>
> Wow, I did not know this trick.  That is very useful.
>
> Thanks a lot.

You can read about scanpypi in out manual:
http://nightly.buildroot.org/manual.html#_infrastructure_for_python_packages
section "17.8.3. Generating a python-package from a PyPI repository".

Yegor
