From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 12:30:01 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <8763gbc3xc.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Fri\, 08 May 2009 11\:57\:51 +0200")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<8763gbc3xc.fsf@macbook.be.48ers.dk>
Message-ID: <87ws8ranva.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> When I pull from other developers and push their changes then git
 Peter> doesn't add my s-o-b (and afaik shouldn't).

To be more clear - When git creates a merge commit, then it doesn't
add my s-o-b, which causes the pre-receive hook to fail. I can fix
that by rebasing your changes, but then I become the committer (which
is wrong) and as the commits don't have my s-o-b's on them the
pre-receive hook fails.

-- 
Bye, Peter Korsgaard
