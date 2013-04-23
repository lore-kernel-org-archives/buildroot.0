From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Apr 2013 23:10:14 +0200
Subject: [Buildroot] [PATCH] busybox: rename patches as per the new
 standard and update 1.21.0 mdev
In-Reply-To: <8761zde433.fsf@dell.be.48ers.dk>
References: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
 <8761zde433.fsf@dell.be.48ers.dk>
Message-ID: <5176F8B6.8020204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/13 16:04, Peter Korsgaard wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   Gustavo> Rename patches as per the patch naming policy and update the
>   Gustavo> mdev fix patch for 1.21.0 which reinstates subsystem matching
>   Gustavo> functionality.
>
> Sorry, I disagree with this rename. I know this is what we discussed at
> the dev day, but it imho makes more sense to use the upstream naming
> convention for busybox:
>
> http://busybox.net/downloads/fixes-1.21.0/

  Actually, if upstream has the patches available for download, they 
should be downloaded instead of of included in buildroot, no?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
