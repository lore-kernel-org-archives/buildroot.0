From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 11:46:40 +0100
Subject: [Buildroot] make: write error: stdout
In-Reply-To: <CAF_dkJB9s1Um95exFi70ucmr4t3bmUohhm2dcj5558n7cuEdcg@mail.gmail.com>
 (Patrick Doyle's message of "Mon, 11 Feb 2019 11:05:58 -0500")
References: <CAF_dkJB9s1Um95exFi70ucmr4t3bmUohhm2dcj5558n7cuEdcg@mail.gmail.com>
Message-ID: <878sylwagf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Doyle <wpdster@gmail.com> writes:

Hi,

 > Has anybody else run into this error?  I just noticed it today (after
 > upgrading my Ubuntu build host to a 4.15.0.45-generic kernel).  When I
 > attempt to build, I keep getting errors of the form:

Funky. It does sound like a Ubuntu specific kernel bug that we cannot
really do anything about. Please let us know if bug 1814393 gets
updated.

-- 
Bye, Peter Korsgaard
