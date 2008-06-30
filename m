From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 16:59:13 +0200
Subject: [Buildroot] Modular X.org
In-Reply-To: <46a136670806231024o11a8f649r583107ac041c23e2@mail.gmail.com>
	(John Voltz's message of "Mon\, 23 Jun 2008 13\:24\:17 -0400")
References: <46a136670806231024o11a8f649r583107ac041c23e2@mail.gmail.com>
Message-ID: <87d4lzdl4u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

Hi,

 John> I just wanted to inform anyone who is interested, the buildroot
 John> tree over at http://code.google.com/p/buildroot can now build
 John> both modular and tiny X.org servers AND drivers. The modular X
 John> will likely only build successfully for desktop machine arches
 John> (i.e. x86, PPC?, etc.) because it requires a PCI bus.

 John> If I can recruit someone with some spare time to generate a
 John> patch against uClibc.org's tree and submit it upstream, I'm
 John> sure everyone will appreciate it.

I've now committed the relevant chunks - Thanks John.

-- 
Bye, Peter Korsgaard
