From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 20 Nov 2019 03:51:52 -0600
Subject: [Buildroot] [External] Re: [PATCH 1/9] package/rcw: upgrade the
 rcw version to LSDK-19.09
In-Reply-To: <20191120104539.37da1c64@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
 <20191120103204.19a15798@windsurf.home>
 <CANQCQpbZdy0q_qvRf8AWKu8wVFTNh8o9fjY7=UDeiKmU8zhnGw@mail.gmail.com>
 <20191120104539.37da1c64@windsurf.home>
Message-ID: <CANQCQpYBjDv8-=hDyOGeCHMQymFqsu3St+9fCvhcgunVQs9UKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changming,

On Wed, Nov 20, 2019 at 3:45 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 20 Nov 2019 03:38:40 -0600
> Matthew Weber <matthew.weber@collins.com> wrote:
>
> > > True, rcw is very short and quite generic. Matt, what do you think?
> >
> > Michael, good points, maybe we could append a prefix to make it
> > freescale-qoriq-rcw?
>
> Yes, freescale-qorqiq-rcw is good.
>

I can send a patch, however do you want to add this rename as a patch
in your current layerscape devkit series as you touch lots of RCW
variables?  Let me know your plan, I can send it but I don't want to
do it in the middle of your work :).

Matt
