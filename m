From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 13:08:17 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for powerpc64le.
In-Reply-To: <8761ksj2pi.fsf@dell.be.48ers.dk>
References: <1401001162-8868-1-git-send-email-jeffbailey@google.com>
 <87r43h7cuq.fsf@dell.be.48ers.dk>
 <20140526112905.35300b6d@free-electrons.com>
 <8761ksj2pi.fsf@dell.be.48ers.dk>
Message-ID: <5385C3A1.9060305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/05/14 11:42, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Peter Korsgaard,
>  > On Sun, 25 May 2014 23:44:13 +0200, Peter Korsgaard wrote:
> 
>  >> Config.in should be indented with <tab>, not spaces.
>  >> 
>  >> Committed with that fixed to next, thanks.
> 
>  > Why the heck did you commit this patch instead of the patch series from
>  > Cody P Schafer which is more elaborate and was posted way before, and
>  > had some review on the list?
> 
> Sorry, seems like I got the patches mixed up. I'll apply the delta from
> Cody's patches.
> 

 You should probably also get rid of the useless fakeroot patch (unless the
intention is to support powerpc64le hosts as well).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
