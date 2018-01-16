From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Tue, 16 Jan 2018 22:42:54 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: use -ffp-contract=off on
 MIPS in the wrapper when needed
In-Reply-To: <20180116210339.4c541835@windsurf>
References: <1516128616-20127-1-git-send-email-johannes.schmitz1@gmail.com>
 <20180116210339.4c541835@windsurf>
Message-ID: <CAMbDF3+fauUH=mdax6gqLxEzhe-xBp8FK7QSiHsmEq5eNymfQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am sorry,  I was fully aware that it wasn't a good thing to do.
Afterwards. The problem is my lack of experiencie with submissions through
git send.
I found some formal mistakes such as missing -s in the submitted patch.
Then it was in the middle of a git rebase --interactive and I screwed up.
So I fully accept your criticism. Will continue learning and promise to do
a more thorough review before sending. Basically I have to get used to the
workflow.

Too bad there is no git send --amend

For now please consider the last patch as the correct one.

Regards
Johannes



Am 16.01.2018 21:03 schrieb "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com>:

Hello,

On Tue, 16 Jan 2018 19:50:16 +0100, Johannes Schmitz wrote:
> This fix is necessary for to build for MIPS, for example for the MIPS
> XBurst architecture used on ci20 boards.
>
> GCC has replaced (no)mfused-madd with ffp-contract.
> Find more details and a long discussion at
> https://gcc.gnu.org/ml/gcc-patches/2015-06/msg00876.html
>
> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>

Within just 3 minutes, you sent this patch 3 times. Two times the exact
same version, and one time a different version. There is also no
version number on the patches, making it very difficult to understand
what is *the* correct patch.

Could you add a version number to your patches (git format-patch -v X),
include a changelog between version (below the --- sign that follows
the Signed-off-by line) and try to avoid sending 3 times the same patch
in a row ? :-)

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180116/5ea947ee/attachment.html>
