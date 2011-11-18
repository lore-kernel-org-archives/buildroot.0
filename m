From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2011 17:41:12 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be> <20111115222819.4dd46e3b@skate>
 <CAAXf6LVgWfk4SeocyimX6qZXLjB5sBhj3i+igAOenBEF9v1t3Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
 <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
Message-ID: <20111118174112.08e536cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Nov 2011 14:05:47 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Although you are right that there is no such thing as a generic patch,
> I still feel there is a conceptual difference between:
> * modifications intended for all versions of a package, for example
> modifications that we know will never go upstream because they are
> buildroot-specific, and
> * modifications which are intended for a specific version, for example
> a backport of a change that was already fixed in a later version.

I get your point.

> To remove our reliance on 'luck', I agree it may be best to add
> version numbers to either type of patch. If a package has multiple
> versions, the patch may simply be duplicated with separate version
> numbers.
> 
> But, should we mark the difference between such patches in a
> different way?

Yes, through comments in the respective patch descriptions.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
