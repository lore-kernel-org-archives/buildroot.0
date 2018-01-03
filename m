From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Jan 2018 09:40:12 -0600
Subject: [Buildroot] [PATCH] daq: new package
In-Reply-To: <CANQCQpbP2D1d_UZfLqWucRpF3t_0EnK=2zHbbVA5O1VS7oogXw@mail.gmail.com>
References: <1514150285-19871-1-git-send-email-sergio.prado@e-labworks.com>
 <20171230211822.7967e315@windsurf>
 <CANu7NGuALNdssHnz9BRApZc_SYQ6VPknZt2ZvML6EAcOX1PQAA@mail.gmail.com>
 <CANQCQpbP2D1d_UZfLqWucRpF3t_0EnK=2zHbbVA5O1VS7oogXw@mail.gmail.com>
Message-ID: <CANQCQpbG2z5oFJWHHp5mp-T66GBDEB8xmScn+f0QV79k+e463g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Wed, Jan 3, 2018 at 8:15 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Sergio,
>
> On Sun, Dec 31, 2017 at 6:22 AM, Sergio Prado
> <sergio.prado@e-labworks.com> wrote:
>>> > diff --git a/package/daq/daq.mk b/package/daq/daq.mk
>>> > new file mode 100644
>>> > index 000000000000..f10c31d4a157
>>> > --- /dev/null
>>> > +++ b/package/daq/daq.mk
>>> > @@ -0,0 +1,26 @@
>>> >
>>> > +################################################################################
>>> > +#
>>> > +# daq
>>> > +#
>>> >
>>> > +################################################################################
>>> > +
>>> > +DAQ_VERSION = 2.0.6
>>> > +DAQ_SITE = https://www.snort.org/downloads/snort
>>> > +DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
>>> > +
>>> > +DAQ_LICENSE = GPL-2.0
>>> > +DAQ_LICENSE_FILES = COPYING
>>>
>
> Just realized I never upstreamed this package we had been carrying
> internally.  There were a couple differences with CONF_OPTS and a
> netfilter queue dependency (may have been self imposed).
> https://nopaste.xyz/?ba118cb90d65e34d#Gk9cY60V/sMzu+UT5nY/YTb8bDq2KV+P1swXhc4v28s=
>

DAQ was used internally for snort, here's what I've got for that one
too.  Never got to upstreaming it and it probably has some bugs :-)
https://nopaste.xyz/?326d9f18b3df4fc2#0B2Zs/N6eiD6OWiMHVvMA0OpAeD7w36hZkDKg/rRFKk=

Matt
