From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 24 Apr 2017 20:27:52 +0200
Subject: [Buildroot] [Patch v5 0/7] Add support for the Rust programming
 language
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <1493058472.5211.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Sat, 2017-04-22 at 19:38 +0200, Eric Le Bihan wrote:
> This series adds support for the Rust programming language by adding the
> following packages:
> 
>  - rustc: a virtual package for the Rust compiler.
>  - rust-bin: provides a pre-built version of rustc.
>  - rust: builds rustc from source.
> 
> Both providers are able to cross-compile code for ARM, MIPS, PowerPC and
> x86_64 architectures. Only the host variants are provided.
> 
> The rustc virtual package is inspired by the mysql one.
> 
> As the Rust compiler is written in Rust and uses Cargo, the Rust package
> manager, as build system, two additional packages are provided: rust-bootstrap
> and cargo-bootstrap.

Many thanks for the work! I'll look into it, when I've some spare time.

J?rg
