From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Sep 2015 08:56:39 -0700
Subject: [Buildroot] [PATCH 1/1] add python simple template module
In-Reply-To: <CAGm1_ksTKFB82=0_UWXJW=HsMC21t+pr7bT6OTJp_2MmfJRVfA@mail.gmail.com>
References: <1442162503-5817-1-git-send-email-stevecalfee@gmail.com>
 <20150913200443.38a3512d@free-electrons.com>
 <CAJJ6jxuir9vNJCPYGVJAoFrjSCcQ2rArXJ+MtB5wNCujasf1Pg@mail.gmail.com>
 <CAGm1_ksTKFB82=0_UWXJW=HsMC21t+pr7bT6OTJp_2MmfJRVfA@mail.gmail.com>
Message-ID: <CAJJ6jxvKnS_aMxNdbFg0r6rkC-Y9r82ATfh7htTzs-Qi+d9JbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Mon, Sep 14, 2015 at 11:23 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Steve,
>
> On Tue, Sep 15, 2015 at 2:41 AM, Steve Calfee <stevecalfee@gmail.com> wrote:
>> Hi Thomas,
>>
>> I just rebuilt and found that the .hash file has to have an eol after
>> that last line. So please reject the V2 version and I will send in
>> another one tomorrow which will survive through a make clean.
>
> while you are at it, please add both md5 and sha256 to the *.hash
> file. Your package is ony PyPi, that already provides MD5. In addition
> we add stronger sha256 checksum. Just take a look at tornado package:
>
> http://git.buildroot.net/buildroot/tree/package/python-tornado/python-tornado.hash
>
> Yegor

This last comment about an example helped a lot. I did not realize
that there was a generic download source at pypi. Much better. So I
changed to that source and included the original md5 as you suggested
as well as my sha256.

The other thing I did not know was how to determine
PYTHON_PYRATEMP_SETUP_TYPE. I guess I stopped at the tutorial in the
manual. The next section "python-package reference" helpfully told me
how to determine the type.

Regards, Steve
