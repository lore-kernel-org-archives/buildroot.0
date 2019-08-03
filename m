From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:48:26 +0200
Subject: [Buildroot] [PATCH 05/13 v2] core: simplify removal of
 generated br2-external files
In-Reply-To: <91a8b2ab88cdfc6421b6348ca45d3c375c9fabfa.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:55 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <91a8b2ab88cdfc6421b6348ca45d3c375c9fabfa.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87tvay81yt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Now that all the br2-external generated files are named after the same
 > pattern, it gets easier to remove them all using a glob.

 > Furthermore, we're on the verge of introducing more such generated
 > files, so removing them at one fell swoop will be simpler too.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
