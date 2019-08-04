From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:11:24 +0200
Subject: [Buildroot] [PATCH] package/json-glib: set -Dintrospection=false
In-Reply-To: <20190715171801.409911-1-alex_y_xu@yahoo.ca> (Alex Xu's message
 of "Mon, 15 Jul 2019 13:18:01 -0400")
References: <20190715171801.409911-1-alex_y_xu@yahoo.ca>
Message-ID: <87blx4r8r7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Xu (Hello71) <alex_y_xu@yahoo.ca> writes:

 > when it is true, the meson script auto-detects the host g-ir-scanner,
 > which is not usable in a cross-compile environment.

 > Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
