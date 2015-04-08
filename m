From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 8 Apr 2015 12:45:06 +0200
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <20150406234303.010225ea@free-electrons.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
 <20150406234303.010225ea@free-electrons.com>
Message-ID: <CAMpxmJVC3rf55hyQ9jaFUv+99HwtFY1SiS6YcMbL4COtPMyK2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-04-06 23:43 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Bartosz Golaszewski,
>
> On Thu, 19 Mar 2015 11:08:28 +0100, Bartosz Golaszewski wrote:
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>> Version 2:
>> - select BR2_PACKAGE_QT5BASE_PNG in Config.in - this is needed for
>>   pulseview to properly display .png icons
>> - don't select libserial port
>
> This package is causing a number of build failures in our automated
> testing system. Can you investigate them?

Sure thing, I'll get right to it.

Cheers,
Bart
