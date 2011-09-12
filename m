From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 19:03:25 -0300
Subject: [Buildroot] [PATCH 3/6] gdb: make it a proper package
In-Reply-To: <1315851029.32089.5.camel@dublxciaranr1.verifone.com>
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
 <1293795546-19674-6-git-send-email-gustavo@zacarias.com.ar>
 <87hbdrc6ar.fsf@macbook.be.48ers.dk> <87aajidiw4.fsf@macbook.be.48ers.dk>
 <1315851029.32089.5.camel@dublxciaranr1.verifone.com>
Message-ID: <4c502c1470d79c270f8dea2aa647e91e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Sep 2011 19:10:21 +0100, Quotient Remainder wrote:

> (Top-posting for clarity)
> Five of the six patches from Gustavo's patch-set containing the one
> below from way back in January was applied; this one wasn't applied.
> Has there been any progress on making GDB and friends a generic 
> target
> since?

There were a couple of issues, OTOH with Kconfig and multiple 
selections in different places which was solved with Yann's help later 
on.
And a couple of build issues, nothing big that i recall.
I can give it a respin if no one else is interested in doing so.
Regards.
