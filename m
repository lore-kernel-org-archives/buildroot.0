From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 16:49:40 +0100
Subject: [Buildroot] So what do we do about all the unmaintained boards?
In-Reply-To: <F9E9391EAD414FA2BA0378C38D349B86@aeglos> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 16\:30\:36 +0100")
References: <1233182567.4147.16.camel@elrond.atmel.com>
	<87vdryrw65.fsf@macbook.be.48ers.dk>
	<F9E9391EAD414FA2BA0378C38D349B86@aeglos>
Message-ID: <87ab9aru23.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> I suggest we remove the boards with 2.4 kernel only today
 Ulf> but we should have one board per architecture we want to support.

 Ulf> There is no PowerPC board support at the moment. Can you fix since you
 Ulf> seem to be working on this?

Why? If the target/generic skeleton and default busybox / uclibc
configs work fine, I don't see much value in adding one.

 Ulf> The BOARD_NAME, BOARD_PATH really belong
 Ulf> in a target/device/<subdir> directory and not in the <buildroot>/project.

Huh? I don't see any references to such variables under project.

-- 
Bye, Peter Korsgaard
