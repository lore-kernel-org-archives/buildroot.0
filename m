From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 07:59:08 +0200
Subject: [Buildroot] [PATCH 1/2] package: instrument to gather timing
	data
In-Reply-To: <CAAXf6LWG8Fhi-+UMi7f2yq4mZLhMvgxSPNVcttF-ErR_q+dwUA@mail.gmail.com>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <0cbf021419332c37bd77e661c97cfc881329f1bb.1318176666.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LWG8Fhi-+UMi7f2yq4mZLhMvgxSPNVcttF-ErR_q+dwUA@mail.gmail.com>
Message-ID: <201110110759.08998.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 10 October 2011 15:41:28, Thomas De Schampheleire wrote:
> And what about making this behavior selectable, i.e. only if a certain
> config option is set, will data be gathered. In the other case,
> 'savetime' and 'outputtime' can be empty functions.

 I think the runtime overhead is minimal, so there isn't much reason to 
disable them.  And you anyway still have the $(call) overhead for each target.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111011/b9122932/attachment.html>
