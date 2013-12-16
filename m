From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 16 Dec 2013 08:40:55 +0000
Subject: [Buildroot] [PATCH] oprofile: fix install for avr32
In-Reply-To: <20131216082955.GG3807@tarshish>
References: <1387182318-21445-1-git-send-email-spdawson@gmail.com>
 <20131216082955.GG3807@tarshish>
Message-ID: <CAHt8ZCP9-AvA6iXTksHTNSrJH3YudMzuG6Ch3LEdiOse9CsBnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 16 December 2013 08:29, Baruch Siach <baruch@tkos.co.il> wrote:
>> +OPROFILE_MAKE = $(MAKE1)
>
> Is this change intended? Have you encountered problems with parallel build?

Oops. No, this was not intended; thanks for spotting it.

Will fix and resubmit.

Simon.
