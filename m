From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:29:51 +0100
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <c5a035da-84c6-f07c-8f99-98b3a38456c9@gmail.com>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
 <20171031214249.7db64df4@windsurf>
 <c5a035da-84c6-f07c-8f99-98b3a38456c9@gmail.com>
Message-ID: <20171101102951.48ed6d91@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Romain: thanks a lot for looking into this issue!

On Tue, 31 Oct 2017 23:22:19 +0100, Romain Naour wrote:

> I don't know why this patch is not backported to 2.26 stable branch (and other
> branch).
> 
> Steve, can you ask on the glibc mailing list ?

Romain, since you're already on the glibc mailing list, and have
already interacted with glibc developers, perhaps you could take care
of this?

In the mean time, we should backport this fix to our glibc 2.26+
version, and possibly also to glibc 2.25 (used in 2017.08). Checking
whether 2017.02 is affected as well would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
