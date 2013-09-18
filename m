From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 00:27:37 +0200
Subject: [Buildroot] [PATCHv2 1/1] board: add cubieboard2 support
In-Reply-To: <1379490058-4736-2-git-send-email-carlos@crqgestion.es> (Carlos
 Quijano's message of "Wed, 18 Sep 2013 09:40:58 +0200")
References: <1379490058-4736-1-git-send-email-carlos@crqgestion.es>
 <1379490058-4736-2-git-send-email-carlos@crqgestion.es>
Message-ID: <87d2o5hijq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Quijano <carlos@crqgestion.es> writes:

 Carlos> Signed-off-by: Carlos Quijano <carlos@crqgestion.es>
 Carlos> ---
 Carlos>  .../cubietech/cubieboard/linux-cubieboard2.config  |  749 ++++++++++++++++++++
 Carlos>  board/cubietech/cubieboard/mkcubiecard.sh          |   15 +-
 Carlos>  board/cubietech/cubieboard/readme.txt              |    9 +-
 Carlos>  configs/cubieboard2_defconfig                      |   40 ++
 Carlos>  package/sunxi-boards/sunxi-boards.mk               |    2 +-

I would have preferred to see the sunxi-boards.mk change in a seperate
commit - But ok, it is presumably needed for cubieboard2.

Committed, thanks.

-- 
Bye, Peter Korsgaard
