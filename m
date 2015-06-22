From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 22 Jun 2015 13:51:54 +0200
Subject: [Buildroot] [PATCH v2] package/i2c-tools: bump to version 3.1.2
In-Reply-To: <CA+TH9VmmBT5PZRWKj2Wo_A1qqpz15K7E+UN_iufNi0p_xFYAmQ@mail.gmail.com>
References: <1434615148-29568-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150618231503.48a6d5c7@free-electrons.com>
 <CA+TH9VmmBT5PZRWKj2Wo_A1qqpz15K7E+UN_iufNi0p_xFYAmQ@mail.gmail.com>
Message-ID: <CA+TH9VkyzXr5w2kWz7NPs_PUC5293ucOLg6sH+h55s49vnyfXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-06-19 8:55 GMT+02:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Thomas Petazzoni,
>
> 2015-06-18 23:15 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> Dear Angelo Compagnucci,
>>
>> On Thu, 18 Jun 2015 10:12:28 +0200, Angelo Compagnucci wrote:
>>> This patch bumps version to 3.1.2 and adds support for the recently
>>> introduced python3 support for py-smbus.
>>>
>>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>>
>> I had applied this patch locally, but unfortunately, the lm-sensors
>> website is dead, so I can't download the new version of i2c-tools.

Following a conversation I had with Jean Delvare, i2c-tools maintainer:

***
AC:  "It's not just you! http://www.lm-sensor.org looks down from here.

JD: I've noticed it too. Hopefully the admin (Axel Thimm) has noticed as
JD: well and is already looking at the problem.

AC: The website is still down, any news on when it will be up again?

JD: No, I tried to contact the admin via LinkedIn but no reply so far.
JD: If you need to download the latest i2c-tools, I have a mirror on my home
JD: page:
JD: http://jdelvare.nerim.net/mirror/i2c-tools/

AC: No problem for me, I submitted a patch to buildroot and cannot be
AC: tested cause main download site failure. Do you think your mirror is
AC: more stable than the official one? Probably I could switch to use your
AC: mirror!

JD: It's the first time since many years that lm-sensors.org is down,
JD: usually it's quite reliable. My mirror is hosted by my ISP and is
JD: certainly very reliable... Up to you.
***

I'm thinking switching to Jean's mirror if you agree. What do you think?
