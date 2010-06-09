From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jun 2010 08:39:22 +0200
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <AANLkTimGqWZLo20F77yKkPhiF7FFowRO0F1sI-zPaiHn@mail.gmail.com>
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com>
	<20100607230541.5f2bf769@surf> <87d3w2k0e0.fsf@macbook.be.48ers.dk>
	<20100608000415.543cae7d@surf>
	<AANLkTikq0K_QAcO7evZCpi9cwqkL_xczCDdYdUN_sCC_@mail.gmail.com>
	<AANLkTimGqWZLo20F77yKkPhiF7FFowRO0F1sI-zPaiHn@mail.gmail.com>
Message-ID: <20100609083922.2b4a28e7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 8 Jun 2010 22:54:31 +0300
Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

> Thomas, what should be done w/ target that depend on busybox skeleton?

I'd say: just convert them over to the normal skeleton.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
