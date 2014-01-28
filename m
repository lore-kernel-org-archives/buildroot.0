From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:54:33 +0100
Subject: [Buildroot] [PATCH 1/5] target: ensure target/ dir is writable
In-Reply-To: <4b79710686ef3bcec64579d677de9a027788b74f.1390939719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 28 Jan 2014 21:11:21 +0100")
References: <cover.1390939719.git.yann.morin.1998@free.fr>
 <4b79710686ef3bcec64579d677de9a027788b74f.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <87bnyv22na.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Nathan Lynch <ntl@pobox.com>
 > If the source target skeleton is read-only (eg. because Buildroot's
 > source dir is), modifications to the output target (such as creating
 > /etc/hostname and /etc/issue) fail.

 > (This can happen if the Buildroot source dir is NFS-mounted read-only
 > to be shared between different machines, for example).

 > Signed-off-by: Nathan Lynch <ntl@pobox.com>
 > [yann.morin.1998 at free.fr: we use rsync now, not cp; --chmod=Du+w
 >  suggested by Arnout; clarify commit log]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
