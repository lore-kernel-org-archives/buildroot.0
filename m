From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 06:58:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1233008716.2298.135.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 23\:25\:16 +0100")
References: <20090126201708.B4FD677458@busybox.osuosl.org>
	<871vup6c9o.fsf@macbook.be.48ers.dk>
	<1233005042.2298.111.camel@elrond.atmel.com>
	<8763k14uz6.fsf@macbook.be.48ers.dk>
	<1233005720.2298.125.camel@elrond.atmel.com>
	<87wsch3fiv.fsf@macbook.be.48ers.dk>
	<1233008716.2298.135.camel@elrond.atmel.com>
Message-ID: <87bptt2sto.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> I don't quite see the problem.

 Ulf> What is the problem then with having environment variables.

That they are yet another way of changing config - And even worse, a
way to silently do so.

 Ulf> Pls come up with an alternative method to enforce
 Ulf> behaviour of buildroot without having to resort to
 Ulf> editing config files.

We don't have environment variables to change most other setting (And
no, please don't add them!), so I'm not convinced we need to add it
for xconfig/menuconfig, just because you prefer xconfig.

The point of having a configuration system like Kconfig is to use it.

Please look at the bigger picture, thanks.

-- 
Bye, Peter Korsgaard
