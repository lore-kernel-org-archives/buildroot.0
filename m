From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Feb 2015 13:26:58 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <54D88E63.4050507@imgtec.com> (Markos Chandras's message of "Mon, 
 9 Feb 2015 10:39:31 +0000")
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
 <87fvag3tdv.fsf@dell.be.48ers.dk> <54D88E63.4050507@imgtec.com>
Message-ID: <87386f46el.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:

Hi,

>> I'm not sure what the impact is of this exactly?
 >> 
 > Nothing you should be worried about. Just FPU ABI extensions for MIPS
 > o32. This just makes it possible to link objects build for different FPU
 > ABIs (assuming they are compatible).

 > https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking

 > ie everything works as expected with glibc-2.21

Ok, thanks.

-- 
Bye, Peter Korsgaard
