From: Esben Haabendal <esben@geanix.com>
Date: Mon, 23 Sep 2019 16:09:19 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/python-numpy: fix setup type
In-Reply-To: <d7ed715e-0e9d-02ba-e81b-f5d845eb69fc@mind.be> (Arnout
 Vandecappelle's message of "Mon, 23 Sep 2019 15:36:13 +0200")
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-2-esben@geanix.com>
 <CAGm1_ks34LrS_a1ftt4O1tzXzPZWahGb85G33ECqYibQeG5Zjw@mail.gmail.com>
 <877e5z7bpt.fsf@geanix.com>
 <d7ed715e-0e9d-02ba-e81b-f5d845eb69fc@mind.be>
Message-ID: <87zhiv3y0g.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> writes:

> On 23/09/2019 08:45, Esben Haabendal wrote:
>> Hi Yegor
>> 
>> Yegor Yefremov <yegorslists@googlemail.com> writes:
>> 
>>> On Fri, Sep 20, 2019 at 6:37 PM Esben Haabendal <esben@geanix.com> wrote:
>>>>
>>>> The numpy package is using distutils, not setuptools.
>>>
>>> Are you sure about this? See
>>> https://github.com/numpy/numpy/blob/master/numpy/distutils/core.py
>> 
>> https://github.com/numpy/numpy/blob/v1.16.4/setup.py#L392
>> 
>> Looks like a setuptools package to me.
>
>  Exactly, and that's how it is defined in Buildroot now. Changing it to
> distutils would be wrong, no?

You are absolutely right.  EOUTOFCOFFEE.

/Esben
