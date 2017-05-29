From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 May 2017 18:43:48 +0200
Subject: [Buildroot] [PATCH/next 1/1] lxc: fix hash of patch
References: <1496044092-78363-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170529121236.5318e2d8@free-electrons.com>
 <CAPi7W83jQ9Z2t9TDLc5ZRo1tmPHF4SkYD86aBAKkOD0=99zwnQ@mail.gmail.com>
Message-ID: <4nvtvdxcra.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 29 May 2017 13:03:35 +0200 schrieb Fabrice Fontaine:

> Dear Thomas,
> 
> 2017-05-29 12:12 GMT+02:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
> 
>> Hello,
>>
>> On Mon, 29 May 2017 09:48:12 +0200, Fabrice Fontaine wrote:
>> > Fix hash of bc5b27d6f6d166d2a6df47982cbe36041ce6b73.patch
>> >
>> > Signed-off-by: Fabrice Fontaine
>> > <fontaine.fabrice@gmail.com>
>>
>> Why did the hash changed?
>>
> I don't know, Bernd sent me an email about it so I fixed it. I don't
> think I made a mistake in my first patch because I had to delete my
> local patch file in dl repository to reproduce the issue. Can the hash
> on a github commit change? Should I download
> 7e0ed7ffa0438a3d0e200a881f2166dc3632dcda (merge commit) instead of
> bc5b27d6f6d166d2a6df47982cbe36041ce6b73?

Hi,

afaics there are two more hashes wrong for github patches:

In package/jack2/jack2.hash
ff1ed2c4524095055140370c1008a2d9cccc5645.patch

In package/qt/qt.hash the hash is wrong for
b8f98d956501dfa4ce03a137f15d404930a56066.patch

Regards, Bernd
