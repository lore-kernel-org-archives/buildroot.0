From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 22:03:43 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121014103518.4fb1089d@skate>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate>
Message-ID: <507DBD9F.4030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 10:35, Thomas Petazzoni wrote:
> I'll have a close look at all this later, but for reference, this is
> almost exactly a feature that Buildroot had years ago, and that we
> painfully progressively removed because it was not used properly by
> anyone, and was crippling the code base and usage of Buildroot with a
> lot of useless complexity.

  Sorry that I'm not letting this go, but: how is this similar to the
project concept that was removed in 2009?  I'm not trying to share any
of the build output between different projects -- the only thing that
is shared is the buildroot directory.

  Should I rename it to something else?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
