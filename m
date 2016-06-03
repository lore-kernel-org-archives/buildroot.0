From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 3 Jun 2016 22:21:42 +0200
Subject: [Buildroot] [PATCH 2/5] python-serial: bump to version 3.1
In-Reply-To: <20160603193823.509e6ab3@free-electrons.com>
References: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
 <1464876330-6890-2-git-send-email-yegorslists@googlemail.com>
 <20160603193823.509e6ab3@free-electrons.com>
Message-ID: <CAGm1_kv5wjk7bceVM785UpAJSFAMcw_XEeur+QWh6+CHhXZq0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 3, 2016 at 7:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu,  2 Jun 2016 16:05:27 +0200, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Change download location.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-serial/python-serial.hash | 6 +++---
>>  package/python-serial/python-serial.mk   | 4 ++--
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> Seems to be causing some build failures:
>
>   http://autobuild.buildroot.org/results/f26/f26351da925d6ef3adea8053dc7fc24061554daf/build-end.log
>
> Can you have a look?

Seems to be Python 2 related. I've submitted a bug:
https://github.com/pyserial/pyserial/issues/123
Will keep an eye on it.

Yegor
