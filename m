From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 12:06:38 +0100
Subject: [Buildroot] [PATCH v2 1/6] hdmiservice: new package
In-Reply-To: <50A228E9.70507@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-2-git-send-email-gregory.hermant@calao-systems.com>
 <20121112193458.1504468b@skate> <50A228E9.70507@calao-systems.com>
Message-ID: <20121113120638.6d605ebf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 13 Nov 2012 12:03:05 +0100, Gr?gory Hermant wrote:
> Hi thomas,
> 
> Le 12/11/2012 19:34, Thomas Petazzoni a ?crit :
> > Dear Gregory Hermant,
> > 
> > On Mon, 12 Nov 2012 18:41:37 +0100, Gregory Hermant wrote:
> >>
> >> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> >> ---
> >>  package/Config.in                  |    1 +
> >>  package/hdmiservice/Config.in      |   10 +++++++++
> >>  package/hdmiservice/hdmiservice.mk |   43 ++++++++++++++++++++++++++++++++++++
> > 
> > Is this software something generic, or very specific to the Snowball
> > platform? I am worried by the package name that is way too generic for
> > something that looks board specific. It seems to be tied to a very
> > custom graphics driver.
> 
> Yes it is specific to the snowball.
> What do you suggest to manage this package ?

Even though we generally prefer to use the upstream name for the
Buildroot package, in this case the upstream name is way too generic.
The package should probably be named snowball-hdmiservice for example.


> > Any reason not to use the 'make install' target which apparently does
> > the right thing?
> > 
> Not really. I just keep a similar syntax as staging part.
> What do you recommend ?

Why not using make install for both the target and staging
installations?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
