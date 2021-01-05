From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 22:35:57 +0100
Subject: [Buildroot] Patch for linux-headers
In-Reply-To: <20201217003006.GA343694@pevik> (Petr Vorel's message of "Thu, 17
 Dec 2020 01:30:06 +0100")
References: <20201217003006.GA343694@pevik>
Message-ID: <87czyj6p8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Hi,
 > I wonder if it's allowed to add patch to add patch for linux-headers.
 > There would have to be more versions for the patch (due headers being built for
 > more versions). I'd like to use my upstreamed patch [1] which fixes
 > "redefinition of struct sysinfo" build failure on MUSL.
 > This so far required to patch affected packages or simply disable them
 > (depends on !BR2_TOOLCHAIN_USES_MUSL).

 > Actually, much simpler patch from Khem Raj could be used [2].

It can be done if needed, but it is naturally easier to handle
without. I noticed that you got some patches applied to the stable
kernels related to this recently - Do those fix the issues, or is an
additional patch needed?

-- 
Bye, Peter Korsgaard
