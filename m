From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 2 Jan 2018 18:51:28 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20171228223629.0fd45695@windsurf>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
 <20171228175256.GA24806@ned> <20171228223629.0fd45695@windsurf>
Message-ID: <20180102175128.GB22123@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-28 22:36:29, Thomas Petazzoni wrote:
> I reviewed the different patches in your series, and I think it's
> really close to a state where it can be merged. If you can take care of
> the few comments/questions in the near future, it would definitely
> help, as I would still have the context in mind.
>
> Two other things that would be nice to do is:
>
>  - Add two test cases in support/testing/. One that builds a system with
>    rust-bin, builds a hello world program in Rust, and run it on the
>    target. And another that does the same, but by building the rust
>    compiler from source. Perhaps additional test cases can be added for
>    Cargo, but I'm not sure how it's supposed to be used.
>
>  - Add a short section in the documentation that explains how the Rust
>    support in Buildroot is working. This would help people trying to do
>    stuff with Rust to understand how things work.

I'll add these. Thanks for the review!

Regards,

--
ELB
