From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 00:46:33 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-firmware
In-Reply-To: <cover.1357247755.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 3 Jan 2013 22:18:56 +0100")
References: <cover.1357247755.git.yann.morin.1998@free.fr>
Message-ID: <877gntomna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!
 Yann> Here is a little series to rework the firmware packages in a consistent
 Yann> way (or so I think).

 Yann> This moves all packages providing firmware files (and only providing
 Yann> firmware files) to their own sub-menu, so that:
 Yann>   - they are easier to spot
 Yann>   - it is more convenient to add new ones in the future

 Yann> Also, new firmware files (for DVB tunners) can be installed from the
 Yann> linux-firmware package.

Committed series, thanks!

-- 
Bye, Peter Korsgaard
