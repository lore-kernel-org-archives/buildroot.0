From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 23:49:31 +0200
Subject: [Buildroot] [PATCH v8] python-pyxml: new package
In-Reply-To: <87mw1ouj00.fsf@dell.be.48ers.dk>
References: <1430493225-19081-1-git-send-email-arnout@mind.be>	<1430496084-22705-1-git-send-email-arnout@mind.be>
 <87mw1ouj00.fsf@dell.be.48ers.dk>
Message-ID: <5543F4EB.8020409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 22:42, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > From: Clayton Shotwell <clshotwe@rockwellcollins.com>
>  > It always uses its own copy of pyexpat, but we can at least make it use
>  > buildroot's expat.so.
> 
>  > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
>  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > ---
>  > Changes:
>  > 	v8: Remove unrelated musl fix (Arnout)
> 
> Committed with a 'select BR2_PACKAGE_EXPAT' added, thanks.

 Ouch, thanks for fixing.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
