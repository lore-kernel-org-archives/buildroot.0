From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 18 Jan 2018 08:48:50 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20171228223629.0fd45695@windsurf>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
 <20171228175256.GA24806@ned> <20171228223629.0fd45695@windsurf>
Message-ID: <20180118074850.GA10580@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2017-12-28 22:36, Thomas Petazzoni wrote:
>
> Two other things that would be nice to do is:
>
>  - Add two test cases in support/testing/. One that builds a system with
>    rust-bin, builds a hello world program in Rust, and run it on the
>    target. And another that does the same, but by building the rust
>    compiler from source. Perhaps additional test cases can be added for
>    Cargo, but I'm not sure how it's supposed to be used.

Is there a glibc-based toolchain suitable for arm vexpress available on
http://autobuild.buildroot.org/toolchains/tarballs/?

I see br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2, but there is no
support for Aarch64 in testing and no artefacts are available.

Regards,

--
ELB
