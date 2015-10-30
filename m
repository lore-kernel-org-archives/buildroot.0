From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Oct 2015 14:58:03 +0100
Subject: [Buildroot] Buildroot LTS?
In-Reply-To: <563336DE.4040809@2net.co.uk>
References: <563336DE.4040809@2net.co.uk>
Message-ID: <20151030145803.6aeb3c2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Fri, 30 Oct 2015 09:22:38 +0000, Chris Simmonds wrote:

> Is there a long term support policy for Buildroot? For example, when the
> next significant bug like heartbleed or shellshock comes along, how do I
> best incorporate the fix in my Buildroot project?
> 
> Looking through the commit history, I gather that Buildroot is a
> "rolling release". There are stable releases several times per year, but
> there are few updates once it is released. So, the way to get security
> fixes would be to update to the latest stable release: is that correct?
> The downside is that that will bring in many changes in addition to
> fixing security bugs and I may have to go through a new QA cycle.
> 
> I would be interested in any comments on the above. What do Buildroot
> users do in practice? Does any 3rd party offer LTS support for Buildroot?

There is currently no long term support policy for the community
maintained Buildroot. We have discussed this topic a few times during
our meetings, as I remember raising the question of whether we should
maintain for a longer period certain specific releases of Buildroot, at
least to take care of the security problems.

So far, our common reaction was that it is rather time-consuming to do
and also not very exciting for volunteers to do. It is the type of
topic that would really be helped if there was some funding from
companies.

That being said, if there is sufficient interest for this, and
developers willing to look at the security issues and submit the
corresponding patches, I'm sure we'd be happy to create such LTS
releases from time to time.

Currently, Buildroot users have two options:

 * Stick to a given Buildroot version, and take care of the security
   updates themselves.

 * Update their Buildroot version, but this as you said has the
   consequence of updating many components in the system, even when the
   update is not strictly necessary from a security point of view.

I would personally be happy to take patches against a given fixed
version of Buildroot, and do regularly some point releases based on
this version. But there need to be some involvement from the interested
users.

As far as security updates provided by third party companies, I guess
several embedded Linux services company would probably be willing to
provide such services. But there is no formal/public offering as far as
I know.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
