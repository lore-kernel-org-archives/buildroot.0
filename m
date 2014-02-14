From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Feb 2014 21:41:04 +0100
Subject: [Buildroot] [PATCH] host python/python3: conditionally disable
	unicodedata
In-Reply-To: <20140213103056.3ad2c056@skate>
References: <e06b104c5f166c541741.1391768165@argentina>
 <20140207112819.2fab19a3@skate>
 <CAAXf6LXfA8rir0O_49wy6Y5ur55k_U7P=88OsJB3JsVTwUzYPA@mail.gmail.com>
 <20140213103056.3ad2c056@skate>
Message-ID: <CAAXf6LXp19PNK3PmsOEFCr_0ZccaR1+o67XbraJ43gnGW4inNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 13 Feb 2014 10:15:14 +0100, Thomas De Schampheleire wrote:
>
>> >> would cause the byte-compilation to fail with message:
>> >>     SyntaxError: ("(unicode error) \\N escapes not supported (can't load
>> >>     unicodedata module)",
>> >>
>> >> Instead, conditionally disable unicodedata based on
>> >> BR2_PACKAGE_PYTHON_UNICODEDATA, also for the host python.
>> >>
>> >> This fixes bug #6542 (https://bugs.busybox.net/show_bug.cgi?id=6542)
>> >>
>> >> Reported-by: Gernot Vormayr <gvormayr@gmail.com>
>> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> >
>> > For information, my upcoming patch series that bumps Python uses
>> > --enable-unicodedata unconditionally for the host python, because
>> > recent versions of python-setuptools need unicodedata.
>> >
>>
>> I think this patch should still be part of 2014.02.
>
> I agree.
>


Peter, now that I have your attention, this one should be applied too
:) (if you agree, of course)

Thanks,
Thomas
