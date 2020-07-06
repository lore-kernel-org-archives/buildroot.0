From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 6 Jul 2020 21:56:59 +0200
Subject: [Buildroot] [PATCH v3] wireless-regdb: allow to recompile
In-Reply-To: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
References: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200706195659.GA29308@x1.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

I addressed the V1 comments, and I'm quite satisfied with the result.
Are there more comments/remarks/questions?

Kind regards,
Kurt

On do, 02 jul 2020 12:36:12 +0200, Kurt Van Dijck wrote:
> changes since v2:
> * fix test for empty config
> 
> changes since v1:
> * more info in commit messages
> * started python3-m2crypto from previously removed python-m2crypto
> * no magic with local files, but explicit control to buildroot
>   for the signing key to use
> * add the public key for signing to linux kernel
> 
> Kind regards
> Kurt
