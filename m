From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:24:29 +0200
Subject: [Buildroot] [PATCH RFC next] package/linux: drop useless
 intermediate DTS booleans
In-Reply-To: <20180226174721.5785-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 26 Feb 2018 18:47:21 +0100")
References: <20180226174721.5785-1-yann.morin.1998@free.fr>
Message-ID: <87vadd4b9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Just use whatever the user specified in the list. An empty list means no
 > DTS was specified.

 > No need to add legacy option, as the behaviour does not change.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Simon van der Veldt <simon.vanderveldt@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
