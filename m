From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Feb 2018 13:26:14 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <59e456bb-cc6d-d209-0853-c53a8eec7a85@micronovasrl.com> (Giulio
 Benetti's message of "Fri, 16 Feb 2018 10:20:27 +0100")
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <87lgfum0aq.fsf@dell.be.48ers.dk>
 <6f81dc33-b3a2-223e-1628-aed8a2e1e747@micronovasrl.com>
 <87vaexlxld.fsf@dell.be.48ers.dk>
 <979834e4-a338-525b-c7fd-1241c72127fb@micronovasrl.com>
 <87mv09lw85.fsf@dell.be.48ers.dk>
 <59e456bb-cc6d-d209-0853-c53a8eec7a85@micronovasrl.com>
Message-ID: <87efllktnd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

Hi,

 >> No, I'm NOT using quilt. quilt is not a required dependency for
 >> Buildroot (and we don't have a host-quilt package), so I'm tweaking
 >> build.sh to use our apply-patches.sh script like we use to apply our
 >> patches instead of quilt.

 > Would it make sense to add host-quilt package?

Well, we could - But as it is fairly simple to patch build.sh to use
apply-patches.sh and no other packages currently needs it I decided not
to do so yet.

-- 
Bye, Peter Korsgaard
