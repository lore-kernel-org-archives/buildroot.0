From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Dec 2014 11:15:55 +0100
Subject: [Buildroot] [PATCH 2/2] libnftnl: add patch to fix libnftnl.pc
	for static linking
In-Reply-To: <1419863895-19319-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Dec 2014 15:38:15 +0100")
References: <1419863895-19319-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419863895-19319-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnmlcujo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to libnftnl to add the Libs.private field in
 > the pkg-config file, which is needed for proper static linking of
 > applications using libnftnl.

 > Fixes the build of programs such as nftables on Blackfin:

 >   http://autobuild.buildroot.org/results/061/06166344cc8e162d3f901c70ee31ce07e481053e/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
