From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Dec 2012 18:02:54 +0100
Subject: [Buildroot] [PATCH 2/2] target: add different methods to encode
	the root password
In-Reply-To: <9a13fa348b5d4f9039c48e2ec539256d567d7483.1356739565.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 29 Dec 2012 01:07:34 +0100")
References: <cover.1356739565.git.yann.morin.1998@free.fr>
 <cover.1356739565.git.yann.morin.1998@free.fr>
 <9a13fa348b5d4f9039c48e2ec539256d567d7483.1356739565.git.yann.morin.1998@free.fr>
Message-ID: <87623jtqv5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> The password can be encoded in different ways (from the weakest
 Yann> to the strongest): des, md5, sha-256, sha-512

 Yann> Add a choice entry to select the method, defaulting to 'md5'.

Care to respin this on top of mainline (E.G. after I changed the logic)?

-- 
Bye, Peter Korsgaard
