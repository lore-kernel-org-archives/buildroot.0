From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jun 2017 23:13:22 +0200
Subject: [Buildroot] [PATCH] intltool: add patch to fix compatibility
	with Perl 5.26
In-Reply-To: <20170611155228.6cda31e2@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 11 Jun 2017 15:52:28 +0200")
References: <20170608070344.30718-1-joerg.krause@embedded.rocks>
 <20170611155228.6cda31e2@windsurf.home>
Message-ID: <87h8zjbngt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu,  8 Jun 2017 09:03:44 +0200, J?rg Krause wrote:
 >> When Perl 5.26 is installed on the host, building some packages like
 >> avahi fail, because of intltool-update:

 > Applied to master, thanks.

 > FWIW, the bug was already reported upstream at
 > https://bugs.launchpad.net/intltool/+bug/1490906.

 > Peter: this is a build fix, we perhaps want it in the LTS branches?

Yes, I think so. Committed to 2017.02.x and 2017.05.x, thanks!

-- 
Bye, Peter Korsgaard
