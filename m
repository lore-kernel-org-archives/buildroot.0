From: Kyle Hayes <kyle@greenmonitor.com>
Date: Thu, 24 Feb 2011 08:15:00 -0800
Subject: [Buildroot] OT: ideas for embedded computers?
In-Reply-To: <201102240627.08274.minimod@morethan.org>
References: <AANLkTi=oM=aixkU_SjF6qXRr70rW0voNS3xRd3yekHAj@mail.gmail.com>
	<201102240627.08274.minimod@morethan.org>
Message-ID: <AANLkTimoTii5GKxR7MwC4ujTJHd_b=7q6qrjPJ7vCh6y@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See below.

On Thu, Feb 24, 2011 at 4:26 AM, Michael S. Zick <minimod@morethan.org> wrote:
> On Wed February 23 2011, Kyle Hayes wrote:
>> Our application is "mild industrial". ?Our systems are installed in existing
>> telephone closets etc. where there is little ventilation but temperatures in
>> the buildings are kept for human comfort. ?Generally the environment is not
>> above 25C.
>>
>
> Oops -
> That certainly must depend on what part of the world your product is in.
>
> A (telephone) equipment closet is rarely serviced by the building's HVAC
> and in the USA the design point used in the telephone industry is 140F (60C).
>
> Plus, in areas where energy conservation is a concern, HVAC systems are turned
> off or set to minimum outside of "office hours" (like weekends).

It is in hotels and they usually have a telephone closet that is
somewhat ventilated or they are so low-tech that the telephone switch
etc. is in the basement storage room which is often a stable
temperature.  The worst situation we had was a installation where the
system was put in the laundry room right over the industrial dryer.
We moved it :-)

Our biggest problems are power stability.  Luckily a cheap UPS costs
very little and will drive our system for hours.  Most hotels have
very overloaded power systems.

> Since the lifetime of a silicon device is halved by every 10C increase in
> operating temperature. . . .
> Save yourself a lot of product grief by setting your maximum temperature
> design point higher, a lot higher than 25C.

It isn't a design point, it is what we've measured as being our
highest general temperature in most cases.

All data is pushed out remotely to several servers in a couple
different hosting locations that are nicely cooled and separately
backed up.  We do not have any problems with data loss.  Our current
problems are too much data :-)  We get a lot of telemetry.

Best,
Kyle
