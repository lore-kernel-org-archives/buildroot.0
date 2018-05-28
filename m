From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 22:36:05 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/elf2flt: replace hard-links
 with copies to fix rpath
In-Reply-To: <99b5f16248ada22680df533f78869bcf552e06d9.1527536710.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 28 May 2018 21:45:18 +0200")
References: <cover.1527536710.git.yann.morin.1998@free.fr>
 <99b5f16248ada22680df533f78869bcf552e06d9.1527536710.git.yann.morin.1998@free.fr>
Message-ID: <87in77v7pm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Do for elf2flt what we did for binutils: replace the hardlinks (which
 > break rpath handling) with copies of the individaul tools.

 > See previous commit (package/binutils: switch from symlinks to copies
 > and commit f9cffb6af4 (binutils: replace hard-links with soft-links to
 > fix rpath) for the complete story.

 > Fixes: #11031.

 > Reported-by: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - use copies, not shell wrappers  (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
