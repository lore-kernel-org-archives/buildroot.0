From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Jan 2018 23:04:00 +0100
Subject: [Buildroot] Google Summer of Code 2018 ?
In-Reply-To: <20180117215208.45dd61b9@windsurf>
References: <20180117215208.45dd61b9@windsurf>
Message-ID: <2f4f4259-9fce-6eb2-c0ed-15c3b86d4811@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-01-18 21:52, Thomas Petazzoni wrote:
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

 This is indeed an interesting topic for GSoC.

> 
>  - Testing infrastructure: the runtime testing infrastructure was
>    added in the mean time. Writing more tests and extending the
>    infrastructure is still needed though.

 Useful, but probably a difficult topic.


>  - Relocatable SDK: this topic is pretty much solved IMO, so this topic
>    is no longer relevant.

 Ack.


>  - Follow upstream updates and CVEs of packages. I think this topic is
>    still relevant, and IMO is the most interesting topic.

 Although interesting, I think this is not very suitable for GSoC. Mostly
because it fits more in a "commercial" use of Buildroot and I don't think GSoC
is really meant for that. But maybe that's more a personal feeling. Probably
doesn't hurt to propose it.


>  - Support for LLVM: an intern from Smile (France) just announced that
>    he will be working on this topic during the next months, so I don't
>    see the point of having a GSOC on the same topic.

 Ack.


>  - Support new languages and complete existing ones. I'm not sure about
>    this one:
>    * For NodeJS, I'm not sure we want to have zillions of packages for
>      the different NodeJS modules
>    * The Go package infrastructure has been resubmitted, and is
>      actively being pushed by Angelo
>    * The Rust support is actively being pushed by Eric
>    So I don't know if there's enough things left to do for this project
>    idea.

 Yeah, and it's also a very tricky subject. All languages are pretty different.


 So, is anyone going to submit these three proposals?

 Regards,
 Arnout


> Any other idea of what's missing in Buildroot, or that could be
> improved ?



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
