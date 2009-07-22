From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jul 2009 21:26:26 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: disable aalib
In-Reply-To: <1248258826-11513-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Wed\, 22 Jul 2009 12\:33\:46 +0200")
References: <1248258826-11513-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <877hy0cye5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Explictly disable the build of the aasink plug-in. Without this fix
 Sven> the plug-in would be built if the aalib headers are found on the host.

Applied.

-- 
Bye, Peter Korsgaard
