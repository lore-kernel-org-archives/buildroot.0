From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 28 Jul 2012 09:55:07 -0700
Subject: [Buildroot] Understanding More about applying patches
In-Reply-To: <CALo-6+igesYYe2-Wj342CauvCgUZAFnUm9TtmW8+ObmUQvmkNQ@mail.gmail.com>
References: <CALo-6+igesYYe2-Wj342CauvCgUZAFnUm9TtmW8+ObmUQvmkNQ@mail.gmail.com>
Message-ID: <CALo-6+h1H16cYK9HZ7=gf98X3KNSc79D8xMkf=JCQ9d7ph_8Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing a bit of research and trying to answer at least part of my own
question, I can see in pkg-gentargets.mk a statement applying patches
and it looks like if I prefix the patches with the name of the
package, "qt-" in this  case, then buildroot should automagically
apply the patches I am trying to add. Is this correct?

On Sat, Jul 28, 2012 at 9:07 AM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> First of all, this is my day to be a "noob" again along with the funny
> hat and the pocket protector.
>
> I am trying to understand a bit more about buildroot as I try to
> figure out how opengl and Qt fit together for the TI AM3517EVM. I have
> gotten to the point where I can compile Qt and the "TI Graphics SDK"
> which builds the opengl libraries outside a buildroot tree but using a
> buildroot toolchain. At this point, I need to understand a bit about
> how patching works and I am coming up without understanding in going
> through the documentation.
>
> I can see in a few buildroot/package directories some patches and
> there are three in package/qt and they are applied. I need to add 3
> more. What I cannot see is how the existing three are applied.
>
> I look through the .mk files for directories with patches and see no
> mention of applying the patches.
>
> Can someone help me understand please how one goes about adding a new
> patch to a buildroot/package directory after unzipping the package
> tarball but before the configure step. Perhaps if I understood how to
> add a patch to an existing package, I can extrapolate a bit to move
> forward.
>
> I see mention of PRE_CONFIGURE_HOOKS & POST_CONFIGURE_HOOKS, but how
> to use these and if these are the method doesnt quite fit in my
> Saturday morning noobie mind today.
>
> --
> Charles Krinke



-- 
Charles Krinke
