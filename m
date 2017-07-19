From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:55:54 +0200
Subject: [Buildroot] [PATCH] efivar: fix build with gcc 7
In-Reply-To: <78474fc422b1274f5f4850920cb57f07326d2849.1499720055.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 10 Jul 2017 23:54:15 +0300")
References: <78474fc422b1274f5f4850920cb57f07326d2849.1499720055.git.baruch@tkos.co.il>
Message-ID: <87a840a5ud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing a warning that breaks the build because of -Werror.
 > Fixes:
 > http://autobuild.buildroot.net/results/33a/33adc3ef139d6814aef4c92ae0bcc4c810ab0b86/
 > http://autobuild.buildroot.net/results/e7d/e7d80e823e13edc6698148244553bd90367bcd03/
 > http://autobuild.buildroot.net/results/3b6/3b61246f8b04a332d1c61732f0eb6e50ea8ca366/

 > Cc: Erico Nunes <nunes.erico@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
