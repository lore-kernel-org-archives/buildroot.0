From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 15:35:05 +0200
Subject: [Buildroot] [git commit] linux-fusion: fix build after af52661d
	(linux: rename LINUX26 to LINUX)
In-Reply-To: <1310991089.8862.14.camel@sven> (Sven Neumann's message of "Mon, 
 18 Jul 2011 14:11:29 +0200")
References: <20110718111345.178148AA8F@busybox.osuosl.org>
 <1310991089.8862.14.camel@sven>
Message-ID: <8762mz7lva.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Still getting hits when I "git grep" for LINUX26:

 Sven>  fs/iso9660/iso9660.mk

Correct, will fix.

 Sven>  scripts/get_linux_config.sh

Thats a false positive.

Thanks.

-- 
Bye, Peter Korsgaard
