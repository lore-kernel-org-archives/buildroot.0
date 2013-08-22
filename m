From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 21:38:58 +0200
Subject: [Buildroot] [PATCH] apply-patches: run patch in batch mode
In-Reply-To: <20130822191303.GC13096@harvey.netwinder.org>
References: <1377150255-4940-1-git-send-email-arnout@mind.be>
 <20130822191303.GC13096@harvey.netwinder.org>
Message-ID: <521668D2.6010600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 21:13, Ralph Siemsen wrote:
> On Thu, Aug 22, 2013 at 07:44:15AM +0200, Arnout Vandecappelle (Essensium/Mind) wrote:
>
>> If the file to be patched is missing, then `patch' will interactively
>> ask for a file to be patched. This is annoying in e.g. the autobuilders
>> because they have to wait for a timeout instead of failing.
>
> Hi Arnout,
>
> I believe you are seeing the same issue I reported recently.
> My solution was to test for the patch existence explicitly:
> http://patchwork.ozlabs.org/patch/266895/

  It's not the patch file that doesn't exist, but the file that should be 
patched.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
