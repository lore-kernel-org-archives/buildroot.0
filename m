From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Jul 2015 08:03:18 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: fix whitespace regex in
	libtool patch hook
In-Reply-To: <1436243640-30793-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Tue, 7 Jul 2015 00:34:00 -0400")
References: <1436243640-30793-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87y4iplvfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The first sed line for ltmain_version attempts to match whitespace before
 > VERSION with [ space_character tab_character ]. The second sed line used to
 > make ltmain_patchlevel has only space characters in the whitespace expression,
 > possibly due to a smart editor automatically converting tabs to spaces. Make
 > these lines consistent with each other and more resilient against accidental
 > loss of tab characters by replacing the tabs with '\t'.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
