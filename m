From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 00:29:24 +0100
Subject: [Buildroot] [PATCH 08/28] x11r7: do not globally select
 libraries
In-Reply-To: <50ECA9ED.5070208@mind.be>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
 <50ECA9ED.5070208@mind.be>
Message-ID: <20130109002924.533f825a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 09 Jan 2013 00:21:17 +0100, Arnout Vandecappelle wrote:

>   Although this is of course a very good idea, it's also risky. Possibly 
> there are some X packages that rely on this implicit select. But I guess 
> the autobuilders will expose those.

Yes, it is risky, but it was clearly incorrect and needs to be fixed.
I've built a number of X.org libraries and applications to uncover
missing dependencies while doing the rest of the patch series, and it
went fine. We'll see what the autobuilders have to say, though :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
