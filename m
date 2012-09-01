From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Sep 2012 17:08:42 +0200
Subject: [Buildroot] Buildroot 2012.08 released
In-Reply-To: <20120831112123.672bd606@skate>
References: <20120831112123.672bd606@skate>
Message-ID: <504224FA.1070908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/31/12 11:21, Thomas Petazzoni wrote:
>   - Cleanups to the package infrastructure. The visible change
>     to developers is that $(eval $(call AUTOTARGETS)) is now
>     $(eval $(autotools-package)), and similarly for other package
>     infrastructures and host packages. Refer to the documentation for
>     details.

  It's unfortunate that my patch for detecting legacy XXXTARGETS usage wasn't merged.
I'm afraid there will be many people hitting that problem...

  (I realize it's my own responsibility for not pushing it a second time when the
deadline was approaching...)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
