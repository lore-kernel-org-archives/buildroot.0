From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 28 Jul 2012 09:07:12 -0700
Subject: [Buildroot] Understanding More about applying patches
Message-ID: <CALo-6+igesYYe2-Wj342CauvCgUZAFnUm9TtmW8+ObmUQvmkNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of all, this is my day to be a "noob" again along with the funny
hat and the pocket protector.

I am trying to understand a bit more about buildroot as I try to
figure out how opengl and Qt fit together for the TI AM3517EVM. I have
gotten to the point where I can compile Qt and the "TI Graphics SDK"
which builds the opengl libraries outside a buildroot tree but using a
buildroot toolchain. At this point, I need to understand a bit about
how patching works and I am coming up without understanding in going
through the documentation.

I can see in a few buildroot/package directories some patches and
there are three in package/qt and they are applied. I need to add 3
more. What I cannot see is how the existing three are applied.

I look through the .mk files for directories with patches and see no
mention of applying the patches.

Can someone help me understand please how one goes about adding a new
patch to a buildroot/package directory after unzipping the package
tarball but before the configure step. Perhaps if I understood how to
add a patch to an existing package, I can extrapolate a bit to move
forward.

I see mention of PRE_CONFIGURE_HOOKS & POST_CONFIGURE_HOOKS, but how
to use these and if these are the method doesnt quite fit in my
Saturday morning noobie mind today.

-- 
Charles Krinke
