From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:50:41 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/nodejs: bump
 version to 8.10.0
In-Reply-To: <CAFGQKxfiSJiQgFLu2VYQNG5KM8t_XuZaGJeDcLJbOu_n4YgzQg@mail.gmail.com>
 (Martin Bark's message of "Mon, 2 Apr 2018 20:20:01 +0100")
References: <20180330213159.4E1C283EBB@busybox.osuosl.org>
 <CAFGQKxfiSJiQgFLu2VYQNG5KM8t_XuZaGJeDcLJbOu_n4YgzQg@mail.gmail.com>
Message-ID: <874lkol1ni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Peter,
 > On 30 March 2018 at 22:12, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=444201fd1c286f722cbd1182a17bc090d8532222
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x
 >> 
 >> See https://nodejs.org/en/blog/release/v8.10.0/
 >> 
 >> Signed-off-by: Martin Bark <martin@barkynet.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> (cherry picked from commit df33aae5f59eaaf40e800acdfefc83e57216ffe8)

 > c-ares, libhttpparser and libuv are bundled with nodejs but we don't
 > use them, we use the 3 libraries instead. So you also need to cherry
 > pick the other 3 patches for onto 2018.02.x so these libraries are up
 > to date too.

Ok. I wasn't sure as the patch bumping nodejs came before these other
version bumps, but I've added them all now.

-- 
Bye, Peter Korsgaard
