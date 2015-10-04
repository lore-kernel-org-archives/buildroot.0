From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 4 Oct 2015 19:51:02 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <56116029.7000204@mind.be>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <56116029.7000204@mind.be>
Message-ID: <CAEYzJUFkZqkD+HQ+bxLaLnATjUw8tdQyWTZzsN=ms5xZ+Y2iGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 October 2015 at 19:21, Arnout Vandecappelle <arnout@mind.be> wrote:
> [...] We anyway don't
> have complete reproducibility at the moment, since the build of host packages
> depends on what is installed on the system.

To get a known set of host packages, Buildroot could run in an
environment setup by Nix[1].

With some extra tricks, you can get _very_ reproducible environments:

  https://garbas.si/2015/reproducible-development-environments.html

I think that's close to as reproducible as it gets, if not emulating
CPU/RAM/filesystem the build runs in :-)

[1] http://nixos.org/nix/

Disclaimer: I'm a Nix(OS) user/contributor.

- Bj?rn
