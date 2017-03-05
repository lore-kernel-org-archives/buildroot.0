From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 23:40:52 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
Message-ID: <20170305234052.2515068d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 23:33:56 +0100, Arnout Vandecappelle wrote:

>  I'm obviously late with commenting on this, but I think marking things as
> BROKEN is wrong. It bypasses the legacy mechanism so it disappears without
> notice. Also, BROKEN packages languish there for years without ever anyone
> taking a look. Sometimes things do get repaired, but re-adding the package is
> not much more complicated than
> 
>  So, I propose to remove all broken packages.
> 
>  [I have the feeling we discussed this kind of thing at some BR devel meeting at
> some point, but I can't find it.]

True. But for this one case, the developer contributing the package is
still active, submitting patches for other things from time to time. So
I was hoping that a stronger hint at "please fix your packages
otherwise they'll get removed" was in order.

Let's say that we'll remove this package before the 2017.05 release if
nobody unbreaks it?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
