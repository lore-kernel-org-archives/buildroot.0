From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:20:40 +0100
Subject: [Buildroot] [PATCH] package/snort: fix error when building on a
 Fedora host machine
In-Reply-To: <20191222091707.31637-1-sergio.prado@e-labworks.com> (Sergio
 Prado's message of "Sun, 22 Dec 2019 06:17:07 -0300")
References: <20191222091707.31637-1-sergio.prado@e-labworks.com>
Message-ID: <87fth8rtjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > Remove a logic from configure script that adds unsafe header/library path when
 > cross-compiling on a Fedora host machine.

 > Fixes:
 > http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4
 > http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976
 > http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4
 > many more...

 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
