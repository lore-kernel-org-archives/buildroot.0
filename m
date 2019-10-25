From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 09:30:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: fixup the 'v'
 prefix in the version
In-Reply-To: <CAEyMn7Y1+YxD9eny8urnpSnQiqp1CQiNoYSQnXajhJJAFfR-1Q@mail.gmail.com>
References: <20191024180653.13243-1-fontaine.fabrice@gmail.com>
 <20191024222536.0032411f@windsurf.home>
 <CAEyMn7Y1+YxD9eny8urnpSnQiqp1CQiNoYSQnXajhJJAFfR-1Q@mail.gmail.com>
Message-ID: <20191025093037.4844c199@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 08:55:01 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > Perhaps it would make sense to add a check in the check-package logic,
> > to verify that the version doesn't look like vX.Y.Z ?  
> 
> I would like to take care of that.

Then you can poke around in utils/checkpackagelib/lib_mk.py and see to
add another check. I'm not sure how the check should work exactly, but
I'll let you figure that out :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
