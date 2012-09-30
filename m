From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Sep 2012 18:29:46 +0200
Subject: [Buildroot] [PATCH] use portable printf instead of echo -e,
 needed for MacOS X buildhost
In-Reply-To: <20120920080117.GA4747@waldemar-brodkorb.de>
References: <20120920080117.GA4747@waldemar-brodkorb.de>
Message-ID: <5068737A.3040404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/12 10:01, Waldemar Brodkorb wrote:
> Hi,
>
> echo -e is not a portable way to do this, better use printf.
> Works with MacOS X.
>
> Signed-off-by: Waldemar Brodkorb<mail@waldemar-brodkorb.de>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
