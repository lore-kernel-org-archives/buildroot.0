From: Esben Haabendal <esben@geanix.com>
Date: Mon, 23 Sep 2019 08:45:02 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/python-numpy: fix setup type
In-Reply-To: <CAGm1_ks34LrS_a1ftt4O1tzXzPZWahGb85G33ECqYibQeG5Zjw@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 20 Sep 2019 21:11:03 +0200")
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-2-esben@geanix.com>
 <CAGm1_ks34LrS_a1ftt4O1tzXzPZWahGb85G33ECqYibQeG5Zjw@mail.gmail.com>
Message-ID: <877e5z7bpt.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor

Yegor Yefremov <yegorslists@googlemail.com> writes:

> On Fri, Sep 20, 2019 at 6:37 PM Esben Haabendal <esben@geanix.com> wrote:
>>
>> The numpy package is using distutils, not setuptools.
>
> Are you sure about this? See
> https://github.com/numpy/numpy/blob/master/numpy/distutils/core.py

https://github.com/numpy/numpy/blob/v1.16.4/setup.py#L392

Looks like a setuptools package to me.

/Esben
