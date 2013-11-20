From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 12:11:48 +0100
Subject: [Buildroot] autobuild annotations
In-Reply-To: <403618053.13241218.1384945410540.JavaMail.root@openwide.fr>
References: <20131120115934.356d52c3@skate>
 <403618053.13241218.1384945410540.JavaMail.root@openwide.fr>
Message-ID: <20131120121148.79482e2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Wed, 20 Nov 2013 12:03:30 +0100 (CET), Jeremy Rosen wrote:

> > However, what autobuild.buildroot.org is doing are *random*
> > configurations. I.e you cannot compare one build to another. This
> > really doesn't fit well in the model of Jenkins in my opinion, and
> > is the reason why a small specific tool was written.
> 
> couldn't failed build configurations be forwarded to jenkins for
> monitoring ?
> 
> Jenkins could drop those compilations once they work again, that
> would provide some form of followup...

Is this really needed? I mean, the autobuilders are already showing us
when a problem occurs, and then we fairly quickly see when it no longer
occurs.

Of course, if someone wants to set up a Jenkins that does this, I have
no problem changing the autobuild.buildroot.org thing to forward broken
configurations to some Jenkins instance. But I personally don't think
it's really worth the effort.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
