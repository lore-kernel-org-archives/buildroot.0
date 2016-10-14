From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 14:54:06 +0200
Subject: [Buildroot] [PATCH 1/2] jsoncpp: follow Debian, Ubuntu,
	Arch convention for headers location
In-Reply-To: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 26 Sep 2016 11:44:21 +0100")
References: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87mvi7851t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Taken from here: https://bugs.gentoo.org/show_bug.cgi?id=452234
 > Currently headers are installed in /usr/include/json/ but this collides
 > with other JSON libraries that also install headers in the same
 > location.

What json libraries are these? I also worried about it, but from a quick
test I didn't see any file name conflicts.

This specific problem is already fixed by:

5d076804edde7914c69f226f34a1d57097f02a55
Author: J?rg Krause <joerg.krause@embedded.rocks>
Date:   Sun Sep 25 16:11:52 2016 +0200

    package/upmpdcli: add patch to fix error not detecting jsoncpp

-- 
Bye, Peter Korsgaard
