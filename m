From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 6 Feb 2018 16:25:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180206135105.GC28439@scaer>
References: <20180206125923.GB20598@australia.be.alcatel-lucent.com>
 <20180206135105.GC28439@scaer>
Message-ID: <CAH=K+6nRr=oT9wr1eeVDkiRMreV3uFmhkBN4rws3ugabeO95Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Feb 6, 2018 at 2:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2018-02-06 13:59 +0100, Thomas De Schampheleire spake thusly:
>> In current Buildroot, clashes occur between the variables _NAME and
>> _BASE_NAME for two packages called foo and foo-base, i.e.
>>
>> Package foo:
>> FOO_NAME = foo
>> FOO_BASE_NAME = foo-1.2.3
>>
>> Package foo-base:
>> FOO_BASE_NAME = foo-base
>> FOO_BASE_BASE_NAME = foo-base-4.5.6
>>
>> where variable FOO_BASE_NAME is clashing between these two packages.
> [--SNIP--]
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Sam Voss <sam.voss@rockwellcollins.com>
