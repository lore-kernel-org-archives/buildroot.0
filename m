From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:50:03 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: fix package names
 starting with a non-char
In-Reply-To: <20181124093452.12350-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 24 Nov 2018 10:34:52 +0100")
References: <20181124093452.12350-1-yann.morin.1998@free.fr>
Message-ID: <87zhtvu3sk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Graphviz' dot utility does not like nodes which names does not start
 > with an ^[[:alpha:]], i.e. 18xx-ti-utils would cause grievance:

 >     Warning: syntax ambiguity - badly delimited number '18x' in line 4 [...]/graph-depends.dot splits into two tokens
 >     Warning: syntax ambiguity - badly delimited number '18x' in line 5 [...]/graph-depends.dot splits into two tokens
 >     Warning: syntax ambiguity - badly delimited number '18x' in line 6 [...]/graph-depends.dot splits into two tokens
 >     Warning: syntax ambiguity - badly delimited number '18x' in line 7 [...]/graph-depends.dot splits into two tokens

 > Prefix nodes with an underscore to fix that.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
