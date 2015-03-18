From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 18 Mar 2015 11:02:28 -0400
Subject: [Buildroot] [PATCH v2] wpa_supplicant: install systemd service
	files
In-Reply-To: <20150311154917.18e3aaec@free-electrons.com>
References: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
 <20150309233256.0b0e0550@free-electrons.com>
 <CANPyyuMi5xqCwn9R0PLLQ7EtEMqX7oHrxZeJPUxJhAqE=E2TvA@mail.gmail.com>
 <20150311154917.18e3aaec@free-electrons.com>
Message-ID: <CANPyyuNphAU9kGjMW1CPsRxZNhQgp+NTJjjjfBRTXY7tsiJJTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 11, 2015 at 10:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Wed, 11 Mar 2015 09:55:08 -0400, Mike Williams wrote:
>
>> Yes, but it will take me a little while, maybe next week. Some of
>> these appear to be mutually exclusive, some of them require specific
>> configuration files for the interface or they will fail, and the
>> wpa_supplicant.service file needs to be modified depending on build
>> options set, etc. so it's not as simple as just enabling all of them.
>
> Well, we had some discussion on IRC, and Arnout pointed out that
> wpa_supplicant may be used for example by connman, and in this case,
> you don't need to have the wpa_supplicant service started at boot.
>
> So maybe in the end, what you propose is the good solution, and leave
> it to the user to actually enable the service at boot if needed.
>
> Arnout?

Did you guys ever decide what you want done here?

Thanks,
Mike
