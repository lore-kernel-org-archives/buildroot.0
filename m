From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 21:40:13 +0100
Subject: [Buildroot] [PATCH 1/9] olimex/a20_olinuxino: update readme.txt
	with lime2 info
In-Reply-To: <1456187073-2876-2-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 23 Feb 2016 01:24:25 +0100")
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
 <1456187073-2876-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <871t813kr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 >  board/olimex/a20_olinuxino/readme.txt | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
 > index 7998aa12e6a4..ab7ab1ec2426 100644
 > --- a/board/olimex/a20_olinuxino/readme.txt
 > +++ b/board/olimex/a20_olinuxino/readme.txt
 > @@ -3,12 +3,13 @@ A20-OLinuXino-LIME and A20-OLinuXino-MICRO
 >  Intro
 >  =====
 
 > -These are open hardware boards, both based an the AllWinners A20 SoC.
 > +These are open hardware boards, all based an the AllWinners A20 SoC.

s/an /on /, and the company is called Allwinner (or Allwinner
Technology). 

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
