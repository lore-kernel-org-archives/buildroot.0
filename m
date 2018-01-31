From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:36:08 +0100
Subject: [Buildroot] [PATCH 2/3] eudev: fix printf usage in init script
In-Reply-To: <20180130040720.20172-2-casantos@datacom.ind.br> (Carlos Santos's
 message of "Tue, 30 Jan 2018 02:07:19 -0200")
References: <20180130040720.20172-1-casantos@datacom.ind.br>
 <20180130040720.20172-2-casantos@datacom.ind.br>
Message-ID: <87po5q5hon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Using a variable in a printf format string may lead to undesirable
 > results if the variable contains format controls, so replace

 >     printf "foo $var bar"

 > by

 >     printf "foo %s bar" "$var"

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed to 2017.02.x and 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
