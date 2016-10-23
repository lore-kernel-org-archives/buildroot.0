From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Oct 2016 10:52:14 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be> (Arnout
 Vandecappelle's message of "Mon, 17 Oct 2016 18:52:43 +0200")
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <6e24662f-d0fd-461e-0059-6f2e23273480@mind.be>
 <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
 <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be>
Message-ID: <87lgxfo3b5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> I'm toying with the idea of a sandbox as well that will just restrict the view
 >> of the full staging area per-package to the dependencies it needs (LD_PRELOADed).
 >> This would alleviate the overhead in copying/linking all those files, but it's a
 >> bit more complex.

 >  Yeah, perhaps we should use bitbake instead of make :-P

Argh!

-- 
Bye, Peter Korsgaard
