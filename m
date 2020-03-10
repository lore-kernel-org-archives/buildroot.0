From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:42:49 +0100
Subject: [Buildroot] [git commit] boot/uboot: license files hashes only
 valid for latest version
In-Reply-To: <20200206193221.AE07D8D426@busybox.osuosl.org> (Peter Korsgaard's
 message of "Thu, 6 Feb 2020 18:38:35 +0100")
References: <20200206193221.AE07D8D426@busybox.osuosl.org>
Message-ID: <874kuvopie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ff1a03ab28c8b5ffd7703cc4710bf20cc6223b5e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > We can only know the details of the license files for known versions.  For
 > custom, older or newer versions, the license files may change, or may be
 > moved around.

 > So, do for U-Boot as was done for ATF, linux, and linux-headers, and only
 > define the list of license files for the latest version.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Markus Mayer <mmayer@broadcom.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
