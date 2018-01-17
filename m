From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 Jan 2018 16:50:13 -0600
Subject: [Buildroot] Google Summer of Code 2018 ?
In-Reply-To: <20180117215208.45dd61b9@windsurf>
References: <20180117215208.45dd61b9@windsurf>
Message-ID: <CANQCQpa3v8pf2CvXd867Xv0e9UPCd-L+Q-9yFgZsRNdVvUnkSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2018 at 2:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> For information, organizations can apply for GSoC 2018 until January
> 23, so there is less than a week left to apply. The questions are: do
> we want to apply? And if yes, for what topics?
>
> Looking at https://elinux.org/Buildroot:GSoC2017Ideas:
>
>  - Reproducible builds. While some initial work was done, there is
>    definitely a lot more that could be done.
>
>  - Testing infrastructure: the runtime testing infrastructure was
>    added in the mean time. Writing more tests and extending the
>    infrastructure is still needed though.
>
>  - Relocatable SDK: this topic is pretty much solved IMO, so this topic
>    is no longer relevant.
>
>  - Follow upstream updates and CVEs of packages. I think this topic is
>    still relevant, and IMO is the most interesting topic.

I'd second that this is an interesting one (even just a manual
approach to start with).  ie. Minimally having our legal-info (or a
new cpe-info) generate CPE compliant tags for our packages would be a
great addition.  Then those lists can be fed into various tools.

>
>  - Support for LLVM: an intern from Smile (France) just announced that
>    he will be working on this topic during the next months, so I don't
>    see the point of having a GSOC on the same topic.
>
>  - Support new languages and complete existing ones. I'm not sure about
>    this one:
>    * For NodeJS, I'm not sure we want to have zillions of packages for
>      the different NodeJS modules
>    * The Go package infrastructure has been resubmitted, and is
>      actively being pushed by Angelo
>    * The Rust support is actively being pushed by Eric
>    So I don't know if there's enough things left to do for this project
>    idea.
>
> Any other idea of what's missing in Buildroot, or that could be
> improved ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
