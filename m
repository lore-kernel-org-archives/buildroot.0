From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:58:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] toolchain: detect external glibc in
	merged /usr
In-Reply-To: <20170903210043.19105-1-camh@xdna.net> (Cam Hutchison's message
 of "Mon, 4 Sep 2017 07:00:43 +1000")
References: <20170903210043.19105-1-camh@xdna.net>
Message-ID: <87376irbzx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:

 > When using an external toolchain that was built with Buildroot and a
 > merged /usr, the dynamic linker is actually in /usr/lib.

 > But the check_glibc macro limits the depth it is looking for the dynamic
 > linker, and misses it when it is in /usr/lib because it is too deep.

 > We could fix that in two ways: increase the depth in which we look
 > for it, or follow symlinks. We choose the second solution.

 > Signed-off-by: Cam Hutchison <camh@xdna.net>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v1 -> v2:
 >   - Reworded commit message (suggested by Yann)

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
