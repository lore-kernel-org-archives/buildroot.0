From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 30 Dec 2017 11:33:29 +0100
Subject: [Buildroot] [PATCH] python-crossbar: add a warning comment
 concerning version bump
In-Reply-To: <20171230102856.GA2921@scaer>
References: <20170302135853.3111-1-yegorslists@googlemail.com>
 <20171230102856.GA2921@scaer>
Message-ID: <CAGm1_kvHVKvkf=BxSyFMqE_s0g+oWXsmCrL6bEKE71zQMc-5UA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Dec 30, 2017 at 11:28 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, All,
>
> On 2017-03-02 14:58 +0100, yegorslists at googlemail.com spake thusly:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> The latest crossbar needs a rather recent setuptools package, that
>> has circular dependencies. Until this issue is not resolved, it is
>> not safe to bump crossbar version.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-crossbar/python-crossbar.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
>> index 3d82d7704..9c543e6cc 100644
>> --- a/package/python-crossbar/python-crossbar.mk
>> +++ b/package/python-crossbar/python-crossbar.mk
>> @@ -4,6 +4,8 @@
>>  #
>>  ################################################################################
>>
>> +# don't bump version as newer setuptools package is needed,
>> +# that still didn't make its way into BR
>
> Now that we are using setup-tools 36.0.1, is this comment still valid?

I'll have to check this and bump to the newest version.

Yegor
