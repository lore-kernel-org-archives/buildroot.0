From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 18 Jan 2018 08:33:46 +0100
Subject: [Buildroot] [PATCH 4/5] python-see: new package
In-Reply-To: <20180117234108.1935ccf2@windsurf>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-4-yegorslists@googlemail.com>
 <20180117234108.1935ccf2@windsurf>
Message-ID: <CAGm1_ksx2Q3YLtnFxHQf7T2XGz_jxPTYPnDU1U_5jCwOyiCcGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2018 at 11:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 11 Jan 2018 10:25:19 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/Config.in                  |  1 +
>>  package/python-see/Config.in       |  6 ++++++
>>  package/python-see/python-see.hash |  4 ++++
>>  package/python-see/python-see.mk   | 14 ++++++++++++++
>>  4 files changed, 25 insertions(+)
>>  create mode 100644 package/python-see/Config.in
>>  create mode 100644 package/python-see/python-see.hash
>>  create mode 100644 package/python-see/python-see.mk
>
> Applied to master, thanks. Just curious: why are you adding this
> package? It seems to only do a cosmetic thing, no?

This is a dependency of txtorcon, that will be needed for the next
crossbar bump.

A side note: our scanpypi script also added hmm package as a
dependency of txtorcon, that has scipy dependency, but hmm package is
commented in the requirements.txt [1]. So I'll have to rework our
regex in scanpypi.

[1] https://github.com/meejah/txtorcon/blob/master/requirements.txt

Yegor
