From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Mar 2012 17:22:00 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <20120319165731.4d3374cd@skate> (Thomas Petazzoni's message of
 "Mon, 19 Mar 2012 16:57:31 +0100")
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120319163011.27d669d2@skate>
 <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
 <20120319165731.4d3374cd@skate>
Message-ID: <87ipi0ims7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 19 Mar 2012 12:52:04 -0300,
 Thomas> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

 >> Reverted? It was never applied.

 Thomas> Sorry, my bad, I thought it had been applied and was the reason of the
 Thomas> failure. I will investigate what is causing this new breakage.

It was afaik the microperl -> gentargets change.

 Thomas> However, I wanted us to *investigate* the potential solutions
 Thomas> to build host-microperl *only* when microperl for the target is
 Thomas> selected, and not when we need a simple random utility such as
 Thomas> intltool running on the host.

Yes, let's find a nice solution. Both your inputs are very much
appreciated. Gustavoz, I haven't had time to look at your fixup patches
yet, but will do so very soon.

-- 
Bye, Peter Korsgaard
