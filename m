From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 24 Feb 2011 06:26:43 -0600
Subject: [Buildroot] OT: ideas for embedded computers?
In-Reply-To: <AANLkTi=oM=aixkU_SjF6qXRr70rW0voNS3xRd3yekHAj@mail.gmail.com>
References: <AANLkTi=oM=aixkU_SjF6qXRr70rW0voNS3xRd3yekHAj@mail.gmail.com>
Message-ID: <201102240627.08274.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed February 23 2011, Kyle Hayes wrote:
> Our application is "mild industrial". ?Our systems are installed in existing
> telephone closets etc. where there is little ventilation but temperatures in
> the buildings are kept for human comfort. ?Generally the environment is not
> above 25C.
> 

Oops -
That certainly must depend on what part of the world your product is in.

A (telephone) equipment closet is rarely serviced by the building's HVAC
and in the USA the design point used in the telephone industry is 140F (60C).

Plus, in areas where energy conservation is a concern, HVAC systems are turned
off or set to minimum outside of "office hours" (like weekends).

Since the lifetime of a silicon device is halved by every 10C increase in
operating temperature. . . .
Save yourself a lot of product grief by setting your maximum temperature
design point higher, a lot higher than 25C.

Mike
PS: If you keep your off-site backups on CD in a bank vault -
It is rare that bank vaults have HVAC - your CDs are probably melting
every summer weekend.
