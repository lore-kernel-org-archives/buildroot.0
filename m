From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 22:20:24 +0200
Subject: [Buildroot] [PATCHv2] Mini-XML: new package
In-Reply-To: <bf4abe24aa676657a02d8559ff258dfcb0024c58.1310567506.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 13 Jul 2011 17:34:19 +0300")
References: <bf4abe24aa676657a02d8559ff258dfcb0024c58.1310567506.git.baruch@tkos.co.il>
Message-ID: <87bowydjav.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> ---
 Baruch> v2:
 Baruch> 	* remove redundant --enable-shared configure option
 Baruch> 	* add cross build workaround patch description

Thanks, committed. I had to adjust to patch to make sure mxmldoc doesn't
even get built, as it uses spawn.h which isn't available on uClibc.

-- 
Bye, Peter Korsgaard
