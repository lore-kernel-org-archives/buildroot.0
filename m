From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 13:24:20 +0200
Subject: [Buildroot] [PATCH 09/12] lvm2: do not override CC and similar
 variables
In-Reply-To: <8739xpzb8t.fsf@macbook.be.48ers.dk>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<c942391bf42f025ad15a7401e753d72a4b40d1b3.1273965305.git.thomas.petazzoni@free-electrons.com>
	<8739xpzb8t.fsf@macbook.be.48ers.dk>
Message-ID: <20100519132420.33a9accf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 May 2010 13:43:14 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Thanks. Is there anything stopping us from converting it to
> Makefile.autotools.in format?

Probably not. In this particular case, I didn't do it because we are in
the stabilization phase and I didn't want to introduce too much
unneeded changes. For mutt, I had to do it because it actually fixed
some problems.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
