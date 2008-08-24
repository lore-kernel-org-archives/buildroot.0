From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 09:51:39 +0200
Subject: [Buildroot] gdb build failure
In-Reply-To: <bbbeeccd0808051443o6033b099q7416aedd156afb60@mail.gmail.com>
	(Wade Berrier's message of "Tue\, 5 Aug 2008 15\:43\:16 -0600")
References: <bbbeeccd0808051443o6033b099q7416aedd156afb60@mail.gmail.com>
Message-ID: <87k5e6svec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

 Wade> Hi,
 Wade> I've noticed that when gdb is getting prepped patches are applied
 Wade> twice.  Any ideas what's going on?  (I've attached the log)

Sorry about that. It got broken in r22624 and I've now fixed it (in
r23193).

-- 
Bye, Peter Korsgaard
