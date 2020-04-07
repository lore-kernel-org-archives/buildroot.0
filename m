From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 09:06:23 +0200
Subject: [Buildroot] [PATCH] linux: run depmod only if modules are
 enabled
In-Reply-To: <20200325002154.5882-1-unixmania@gmail.com> (unixmania's message
 of "Tue, 24 Mar 2020 21:21:54 -0300")
References: <20200325002154.5882-1-unixmania@gmail.com>
Message-ID: <871rozsrkg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > If the kernel configuration CONFIG_MODULES disabled, there's no
 > /lib/modules/<version> directory, causing this:

 > depmod: ERROR: could not open directory [...]/target/lib/modules/4.19.8: No such file or directory
 > depmod: FATAL: could not search modules: No such file or directory
 > Makefile:745: recipe for target 'target-finalize' failed

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
