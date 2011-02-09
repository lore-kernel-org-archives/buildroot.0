From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Feb 2011 23:12:33 +0100
Subject: [Buildroot] [PATCH 02/13] util-linux: convert to autotargets
	and bump to 2.18
In-Reply-To: <4D530C19.3050407@zacarias.com.ar> (Gustavo Zacarias's message of
	"Wed, 09 Feb 2011 18:50:17 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-2-git-send-email-gustavo@zacarias.com.ar>
	<87bp2kkhhl.fsf@macbook.be.48ers.dk>
	<4D530C19.3050407@zacarias.com.ar>
Message-ID: <874o8cj1ri.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Could you take a look at it?

 Gustavo> Did you apply the previous e2fsprogs patch? It's required for it to
 Gustavo> export libbklid :)

Yes I did. I even fixed it to also install the pkg-config files.

-- 
Bye, Peter Korsgaard
