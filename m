From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Nov 2013 00:06:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-18
In-Reply-To: <20131119085606.5D65F100B2F@stock.ovh.net>
References: <20131119085606.5D65F100B2F@stock.ovh.net>
Message-ID: <528BEEEB.8010902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 09:56, Thomas Petazzoni wrote:
>         arm |                      pv-1.4.12 | NOK |http://autobuild.buildroot.net/results/c4f5ed916d85740ec00f5f34ded5de0195e5cd45/

  I'm looking at this one.

>     powerpc |                  qt5base-5.1.1 | NOK |http://autobuild.buildroot.net/results/2090d36fffb71f353dc0f8d9399ca7322aeb3826/

  This one requires a patch from Fedora, Fatih is hopefully looking at it.

>      mipsel |                  qt5base-5.1.1 | NOK |http://autobuild.buildroot.net/results/68d508f662a5f7a0d2bf57cbfd5d56ece0aab206/

  MIPS1 isn't supported by qt5. Gustavoz proposed to remove support for 
MIPS1 completely, so this may be yet another reason to do that?

  Perhaps we can start by deprecating it in 2013.11, so we get some 
feedback from potential users of that architecture?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
