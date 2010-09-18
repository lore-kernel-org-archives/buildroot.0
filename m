From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Sep 2010 23:05:03 +0200
Subject: [Buildroot] [PATCH] host tools: create the host sed in
	$(O)/host/
In-Reply-To: <20100914080235.2345b253@surf> (Thomas Petazzoni's message of
	"Tue, 14 Sep 2010 08:02:35 +0200")
References: <1284420434-22718-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<20100914080235.2345b253@surf>
Message-ID: <87r5gq4vb4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Tue, 14 Sep 2010 01:27:14 +0200
 Thomas> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

 >> The host sed does not belong to $(O)toolchain/ but
 >> really belongs to $(O)/host/

 Thomas> In my opinion, the host-sed does not belong anywhere, we could just use
 Thomas> the real host sed, and remove all the crap to detect if the host sed is
 Thomas> good or not, the symlinking stuff, etc.

Agreed. Care to make a patch?

-- 
Bye, Peter Korsgaard
