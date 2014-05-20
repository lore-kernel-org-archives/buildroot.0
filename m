From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:36:25 +0200
Subject: [Buildroot] [PATCH] build: remove sstrip
In-Reply-To: <20140520212336.GC3506@free.fr> (Yann E. MORIN's message of "Tue, 
 20 May 2014 23:23:36 +0200")
References: <1400620403-14763-1-git-send-email-yann.morin.1998@free.fr>
 <20140520212336.GC3506@free.fr>
Message-ID: <8738g4gmjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > All,
 > On 2014-05-20 23:13 +0200, Yann E. MORIN spake thusly:
 >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> 
 >> Quoting Thomas on IRC:
 >> > sstrip is a piece of crap that we should exterminate
 >> > from the surface of the planet
 >> 
 >> sstrip is now unmaintained, has a long history of generating butchered
 >> binaries in some cases, and does not gain that much space in the end.
 >> 
 >> Obliviate sstrip from the strip options, anihilate the sstrip package,
 >> scortch any reference in fire, and cleanse our tree free of any remnants...

 > Missing legacy option, though. Will respin a bit later...

Thanks. As mentioned on IRC I would prefer to see two patches:

- One to mark it as deprecated for 2014.05 (BR2_DEPRECATED_SINCE_2014_05)
- And another to remove it. This we can normally only merge for 205.05.

-- 
Bye, Peter Korsgaard
