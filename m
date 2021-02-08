From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 8 Feb 2021 15:09:56 -0600
Subject: [Buildroot] [PATCH v2 5/7] support/scripts/gen-missing-cpe: add
 new script
In-Reply-To: <159f1b0c-07cd-e6b4-dc7f-1cbea516efb7@mind.be>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-6-thomas.petazzoni@bootlin.com>
 <159f1b0c-07cd-e6b4-dc7f-1cbea516efb7@mind.be>
Message-ID: <CANQCQpYpOe7uLwccwXUpsDRwOP6jP2o0vo5TPtdHSxusCWcarQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Tue, Feb 2, 2021 at 3:29 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 31/01/2021 14:38, Thomas Petazzoni wrote:
> > From: Matt Weber <matthew.weber@rockwellcollins.com>
> >
> > This script queries the list of CPE IDs for the packages of the
> > current configuration (based on the "make show-info" output), and:
> >
> >  - for CPE IDs that do not have any matching entry in the CPE
> >    database, it emits a warning
>
>  Maybe there should also be a warning for packages which don't have cpeid set at
> all...

Agree, this would be something that people would miss if we don't list
the missing.  My original iteration had that as a category that was
printed to screen but no XML generated for it.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

Regards,
Matt
