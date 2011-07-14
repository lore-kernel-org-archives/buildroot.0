From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jul 2011 15:43:47 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.08/debugging-improvements
In-Reply-To: <20110714153638.2143a699@skate> (Thomas Petazzoni's message of
 "Thu, 14 Jul 2011 15:36:38 +0200")
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
 <87sjqchsbe.fsf@macbook.be.48ers.dk> <20110714153638.2143a699@skate>
Message-ID: <87aachc6zw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Next to the size impact (which I agree is not a big problem) there's
 >> also potentially a build time impact. Did you test this?

 Thomas> Here is the result of a fairly big build for ARM (X.org, Gtk2, WebKit,
 Thomas> Midori), on a fairly big machine (quad-core, 12 GB of RAM), build was
 Thomas> done with BR2_JLEVEL=16, and the build does not include a toolchain (I
 Thomas> used an existing internal toolchain).

Thanks!

 Thomas> Without debugging symbols
 Thomas> =========================

 Thomas>  * Size of output directory:	3.4 GB
 Thomas>  * Size of staging directory:	445 MB

 Thomas> With debugging symbols
 Thomas> ======================

 Thomas>  * Size of output directory:	9.0 GB
 Thomas>  * Size of staging directory:	2.0 GB

 Thomas> So, I'd say we should drop my patch 2/4.

Yeah, this is a bit too much.

-- 
Bye, Peter Korsgaard
