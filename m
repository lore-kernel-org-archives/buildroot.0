From: Chris Simmonds <chris@2net.co.uk>
Date: Fri, 30 Oct 2015 09:22:38 +0000
Subject: [Buildroot] Buildroot LTS?
Message-ID: <563336DE.4040809@2net.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is there a long term support policy for Buildroot? For example, when the
next significant bug like heartbleed or shellshock comes along, how do I
best incorporate the fix in my Buildroot project?

Looking through the commit history, I gather that Buildroot is a
"rolling release". There are stable releases several times per year, but
there are few updates once it is released. So, the way to get security
fixes would be to update to the latest stable release: is that correct?
The downside is that that will bring in many changes in addition to
fixing security bugs and I may have to go through a new QA cycle.

I would be interested in any comments on the above. What do Buildroot
users do in practice? Does any 3rd party offer LTS support for Buildroot?

Best regards,
Chris Simmonds
