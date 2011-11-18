From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Nov 2011 23:53:17 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <201111181751.22578.arnout@mind.be> (Arnout Vandecappelle's
 message of "Fri, 18 Nov 2011 17:51:22 +0000")
References: <20111102160349.4afe5935@skate>
 <CAAXf6LUYoR7Hoasa0K-Rc3qJuATFn8mKWMbuKNtnU6XSSALpaQ@mail.gmail.com>
 <CAEYzJUHexHVW+q95qUD3dVp5cTJp7Hu2yGShdkNr5w-rRfnoBw@mail.gmail.com>
 <201111181751.22578.arnout@mind.be>
Message-ID: <87fwhlrqjm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  To implement a clean-staging, we'll probably need to use the
 Arnout>  copy-to-staging step of the external toolchains for all
 Arnout>  toolchains.

Rather than handling both staging and target, I would prefer to move to
generating target from staging just before the filesystems are created
(similar to the other target-finalize stuff).

-- 
Bye, Peter Korsgaard
