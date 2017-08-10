From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:59:27 +0200
Subject: [Buildroot] [Patch v7 00/10] Add support for the Rust
 programming language
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <03972004-18b2-3889-8645-7cb8366f7346@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Eric,

On 23-07-17 10:11, Eric Le Bihan wrote:
> This series adds support for the Rust programming language by adding the
> following packages:

 I commented on all patches, and marked all as Changes Requested in patchwork.

 Regards,
 Arnout

> 
>  - rustc: a virtual package for the Rust compiler.
>  - rust-bin: provides a pre-built version of rustc.
>  - rust: builds rustc from source.
>  - cargo: builds Rust package manager from source.
> 
> Both providers are able to cross-compile code for ARM, MIPS, PowerPC and
> x86_64 architectures. Only the host variants are provided.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
