From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 6 Feb 2018 08:13:40 -0600
Subject: [Buildroot] [PATCH 2/3] hostapd: make ACS dependent on nl80211
In-Reply-To: <20171230155736.1668-3-alexander.i.mukhin@gmail.com>
References: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
 <20171230155736.1668-3-alexander.i.mukhin@gmail.com>
Message-ID: <CAKGmAFq8xxVj39yU206VUrPRq7_1KTPE65EO0BCijxTN0HtMww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+Sam

On Sat, Dec 30, 2017 at 9:57 AM, Alexander Mukhin
<alexander.i.mukhin@gmail.com> wrote:
> According to hostapd's defconfig file, ACS is currently only supported
> through the nl80211 driver. Search through the source code also confirms
> that ACS machinery is present in the nl80211 driver only.
>
> Although hostapd can be built with ACS enabled and nl80211 disabled, an
> attempt to use ACS with other drivers by setting a wireless channel to 0
> results in a runtime failure (driver doesn't accept this value). So we
> might save a user from selecting a meaningless combination by making ACS
> dependent on nl80211.
>
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ RC Linux Platform

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
