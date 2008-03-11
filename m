From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 20:40:58 +0100
Subject: [Buildroot] $(ARCH) not set & mirrors
In-Reply-To: <47D6DBD6.5010105@lindoze.net> (Florian Huber's message of "Tue\,
	11 Mar 2008 20\:21\:58 +0100")
References: <1205178237.10692.178.camel@nigel-x60>
	<878x0q2uyr.fsf@macbook.be.48ers.dk>
	<1205216387.10692.185.camel@nigel-x60>
	<871w6hznbg.fsf@macbook.be.48ers.dk>
	<1205224708.10692.195.camel@nigel-x60>
	<87lk4py797.fsf@macbook.be.48ers.dk> <47D6DBD6.5010105@lindoze.net>
Message-ID: <87zlt5rqut.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Florian" == Florian Huber <florian.huber@lindoze.net> writes:

Hi,

 Florian> BUT it does not make sence anyway because the 4.2.x gcc does
 Florian> not support the arch=geode or tune=geode yet. So I get
 Florian> errors when the gcc ./configure is executed.  Only
 Florian> work-around is to use a generic i586 target.

Or get GCC 4.3 (where it is supported) working.

-- 
Bye, Peter Korsgaard
