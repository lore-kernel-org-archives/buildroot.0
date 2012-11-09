From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 10:27:02 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <509C71ED.9010906@ethertek.ca>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <509C71ED.9010906@ethertek.ca>
Message-ID: <509CCC66.4040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 04:01, Dan Pattison wrote:
> In the perlcross Makefile, if you change perl5160delta.pod   to perl5162delta.pod in three places then you can compile
> the newest perl-5.16.2. Tested for arm, confirmed working.

  Thanks, I'll try that later.

  Regards,
  Arnout

  PS Dan, if you reply to such a long mail, it helps if you strip away some of
the quoted text.  Saves people with simple mail readers a lot of scrolling.
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
