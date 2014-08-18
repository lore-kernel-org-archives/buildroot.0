From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Aug 2014 11:04:20 +0200
Subject: [Buildroot] [PATCH 0/24 v5] arch: move atomics to arch,
	not toolchain (branch yem/atomics)
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 17 Aug 2014 21:29:58 +0200")
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <877g26w4mj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This series is a follow-up to, and includes Anton's series, to introduce
 > awareness of atomic operations, so pacjages can be hidden-away on
 > architectures that do not provide atomic operations.

 > We've discussed this with Thomas on IRC and on the list, and although
 > this comes late in the cycle, we both consider this to be materials for
 > the *current* release.

 > I tried to cover all bases here, but there are architectures I have
 > close-to-zero knowledge of, so please speak up if you disagree on my
 > proposal.

 > The series is split in thre parts:

 >   - patches 1..7 renames the option, and moves it out of toolchain and
 >     to an architecture option, and add the option to the manual;

 >   - patches 8..11 hides more packages due to their requiring atomics

 >   - patches 12..24 convert all our architectures to selectively declare
 >     their (non-)support for atomic ops, to finally get rid of the
 >     generic default value.


 > Changes v4 -> v5:
 >   - enhance the manual  (Thomas DS)
 >   - misc typoes  (Thomas DS)

Committed series, thanks all!

-- 
Bye, Peter Korsgaard
