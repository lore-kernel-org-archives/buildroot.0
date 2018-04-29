From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 29 Apr 2018 10:52:00 +0200
Subject: [Buildroot] [PATCH 1/2] python-watchdog: add support for uClibc
In-Reply-To: <20180428233507.479ea87f@windsurf>
References: <1518787921-32089-1-git-send-email-yegorslists@googlemail.com>
 <20180428233507.479ea87f@windsurf>
Message-ID: <CAGm1_kvSkCjMFU9TvENubQCX3-YGTLVJet-1vYYefK+LsKRkAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 28, 2018 at 11:35 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 16 Feb 2018 14:32:00 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> This patch fixes uClibc detection.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  ...dd-a-workaround-to-support-uClibc-library.patch | 43 ++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
>
> Applied to master, thanks. Did you submit this patch upstream ?

I'll do this, but the project seems to be abandoned :-(

Yegor

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
