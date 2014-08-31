From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 22:23:33 +0200
Subject: [Buildroot] [PATCH v2 for 2014.08] manual/user
	guide/customization: rework section on rootfs customization
In-Reply-To: <32d666f0bce6eda21334.1409490870@localhost> (Thomas De
 Schampheleire's message of "Sun, 31 Aug 2014 15:14:30 +0200")
References: <32d666f0bce6eda21334.1409490870@localhost>
Message-ID: <87zjekmmre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > This patch reworks the section on root filesystem customization as follows:
 > - use labeled list instead of bulleted list to clarify the different methods
 > - move rootfs overlay and post-build scripts to the top and label them as
 >   recommended.
 > - split post-image to a separate section, as it is not related to the target
 >   filesystem customization
 > - line up post-build and post-image explanations, for example regarding
 >   working directory of the script
 > - general expansion of some of the explanation
 > - general rewording

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2: add missing file (noticed by Yann)

Committed, thanks.

-- 
Bye, Peter Korsgaard
