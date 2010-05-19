From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 May 2010 13:51:09 +0200
Subject: [Buildroot] [PATCH 09/12] lvm2: do not override CC and similar
	variables
In-Reply-To: <20100519132420.33a9accf@surf> (Thomas Petazzoni's message of
	"Wed, 19 May 2010 13:24:20 +0200")
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<c942391bf42f025ad15a7401e753d72a4b40d1b3.1273965305.git.thomas.petazzoni@free-electrons.com>
	<8739xpzb8t.fsf@macbook.be.48ers.dk> <20100519132420.33a9accf@surf>
Message-ID: <87eih8xg7m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Tue, 18 May 2010 13:43:14 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Thanks. Is there anything stopping us from converting it to
 >> Makefile.autotools.in format?

 Thomas> Probably not. In this particular case, I didn't do it because
 Thomas> we are in the stabilization phase and I didn't want to
 Thomas> introduce too much unneeded changes. For mutt, I had to do it
 Thomas> because it actually fixed some problems.

OK.

-- 
Bye, Peter Korsgaard
