From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 18 Jan 2018 09:03:35 +0100
Subject: [Buildroot] [PATCH 5/5] python-crossbar: bump to version
 17.6.1.post3
In-Reply-To: <20180117234235.032486fc@windsurf>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-5-yegorslists@googlemail.com>
 <20180117234235.032486fc@windsurf>
Message-ID: <CAGm1_ksN6N_bu8H4m14uMSpPJ=NB2NJQVbJxatudKJdXRfs4xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2018 at 11:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 11 Jan 2018 10:25:20 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Update dependencies and add licence checksum.
>>
>> As BR now has the latest setuptools version, remove now obsolete
>> comment.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Applied, thanks!
>
> Crossbar has a lot of dependencies, so perhaps it would be useful to
> add a runtime test for it in support/testing/ ? I.e a test that builds
> a configuration with Crossbar enabled, boots it and verifies that
> Crossbar works in a minimal way.

No problem, but do we have final solution for the tests? I've sent a
patch [1], then Yann has sent some patches. What is the current state
of this issue?

[1] http://patchwork.ozlabs.org/patch/811011/

Yegor
