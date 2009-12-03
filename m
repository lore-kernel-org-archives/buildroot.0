From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Dec 2009 14:24:18 +0100
Subject: [Buildroot] Help understanding how to develop with buildroot
In-Reply-To: <87r5rcryj1.fsf@macbook.be.48ers.dk>
References: <16d4c3590912021826v916b813gf6f422634058df54@mail.gmail.com>
	<878wdktkm6.fsf@macbook.be.48ers.dk>
	<16d4c3590912030440j4655c776w9dc54c3f0fe46cab@mail.gmail.com>
	<87r5rcryj1.fsf@macbook.be.48ers.dk>
Message-ID: <20091203142418.205e65e4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 03 Dec 2009 14:13:22 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> OK, you can trigger a rebuild of just your package by removing the
> correct file (depends on how you integrated it in BR what that file
> is) or simply delete the build_arm/<package> directory.

See also http://buildroot.org/buildroot.html#rebuilding_packages for
details.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
