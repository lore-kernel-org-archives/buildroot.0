From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 15 Jun 2017 16:25:28 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/python-traitlets: New package
In-Reply-To: <20170615231219.530631ea@windsurf.lan>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
 <20170612234216.902-2-andrew.smirnov@gmail.com>
 <20170615231219.530631ea@windsurf.lan>
Message-ID: <CAHQ1cqFAjMFb6r4ys_oUrp2jR=m3g5s6QH4GaaXwqvYk3oAgCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 15, 2017 at 2:12 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 12 Jun 2017 16:42:10 -0700, Andrey Smirnov wrote:
>> Add 'traitlets'[1] package to Buildroot. Needed by IPython.
>>
>> [1] https://pypi.python.org/pypi/traitlets
>>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  DEVELOPERS                                     |  1 +
>>  package/Config.in                              |  1 +
>>  package/python-traitlets/Config.in             | 10 ++++++++++
>>  package/python-traitlets/python-traitlets.hash |  3 +++
>>  package/python-traitlets/python-traitlets.mk   | 14 ++++++++++++++
>>  5 files changed, 29 insertions(+)
>>  create mode 100644 package/python-traitlets/Config.in
>>  create mode 100644 package/python-traitlets/python-traitlets.hash
>>  create mode 100644 package/python-traitlets/python-traitlets.mk
>
> Entire series applied. I fixed some minor nits along the way, I'll reply
> to the individual patches about them.

Wonderful, thank you!

> What about adding a test in the runtime test infrastructure that
> verifies that ipython runs fine with both python2 and python3 ?
>

I am not very familiar with BR's testing infrastructure, so it will
take me some time to figure out, but I'll give it a try and send a
patch separately.

Thanks,
Andrey Smirnov
