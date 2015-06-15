From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 15 Jun 2015 16:29:28 +0200
Subject: [Buildroot] [PATCH v2 3/3] boot/at91bootstrap3: download via
 custom git url
In-Reply-To: <20150615161828.63441a90@free-electrons.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
 <1433234780-21084-4-git-send-email-angelo.compagnucci@gmail.com>
 <20150615161828.63441a90@free-electrons.com>
Message-ID: <CA+TH9V=twZTuO+8LUspcb1DNCPYCGuM=vAoaoUNHAaSBM=5t1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-06-15 16:18 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Tue,  2 Jun 2015 10:46:20 +0200, Angelo Compagnucci wrote:
>> This patch adds the option to download at91bootstrap3 from
>> a custom git URL. This is a requirement for all that boards
>> that use a custom at91bootstrap3 version.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>> Changes v1 -> v2:
>>  - Adding error handling for BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL and
>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
>
> Applied, thanks.

A really big and appreciated thank you!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
