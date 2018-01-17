From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 21:52:08 +0100
Subject: [Buildroot] Google Summer of Code 2018 ?
Message-ID: <20180117215208.45dd61b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For information, organizations can apply for GSoC 2018 until January
23, so there is less than a week left to apply. The questions are: do
we want to apply? And if yes, for what topics?

Looking at https://elinux.org/Buildroot:GSoC2017Ideas:

 - Reproducible builds. While some initial work was done, there is
   definitely a lot more that could be done.

 - Testing infrastructure: the runtime testing infrastructure was
   added in the mean time. Writing more tests and extending the
   infrastructure is still needed though.

 - Relocatable SDK: this topic is pretty much solved IMO, so this topic
   is no longer relevant.

 - Follow upstream updates and CVEs of packages. I think this topic is
   still relevant, and IMO is the most interesting topic.

 - Support for LLVM: an intern from Smile (France) just announced that
   he will be working on this topic during the next months, so I don't
   see the point of having a GSOC on the same topic.

 - Support new languages and complete existing ones. I'm not sure about
   this one:
   * For NodeJS, I'm not sure we want to have zillions of packages for
     the different NodeJS modules
   * The Go package infrastructure has been resubmitted, and is
     actively being pushed by Angelo
   * The Rust support is actively being pushed by Eric
   So I don't know if there's enough things left to do for this project
   idea.

Any other idea of what's missing in Buildroot, or that could be
improved ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
