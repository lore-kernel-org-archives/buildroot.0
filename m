From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 20 Mar 2015 19:08:22 +0100
Subject: [Buildroot] Buildroot on OSX
In-Reply-To: <CA+-urNQQ9gSwRtmkNq0FBTDqaBuc5bZSS3LQYgsNGB3aEa4sHw@mail.gmail.com>
References: <CA+-urNQQ9gSwRtmkNq0FBTDqaBuc5bZSS3LQYgsNGB3aEa4sHw@mail.gmail.com>
Message-ID: <20150320180814.GH21001@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,
Frank Hunleth wrote,

> Hi,
> 
> I was just asked if it was possible to use Buildroot natively on a
> Mac. I recommended that he just build in a Linux VM. However, after
> playing around at command line and learning about Homebrew, it looked
> like it may not be too far off especially since Buildroot builds so
> much itself. Ignoring external toolchains which I would assume
> wouldn't work, has anyone done this?

Once I tried to do this, but there wasn't much interest to carry
needed patches in buildroot. It is hard to get these Darwin-to-Linux
cross-compile patches into upstream projects.
Recently I discussed some of the patches I am using in OpenADK with
a friend and we will try to reduce them and do it in a better way,
which might even be usable for buildroot.

So for now, you could play with OpenADK, which I use to
cross-compile Linux Embedded stuff on my Mac with Homebrew.

best regards
 Waldemar
