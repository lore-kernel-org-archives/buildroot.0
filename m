From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jan 2012 21:22:46 +0100
Subject: [Buildroot] [PATCH] sqlcipher: new package
In-Reply-To: <20120123095923.56576574@skate>
References: <1327183020-16149-1-git-send-email-arnout@mind.be>
 <20120123095923.56576574@skate>
Message-ID: <201201232122.46458.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 January 2012 09:59:23 Thomas Petazzoni wrote:
> Le Sat, 21 Jan 2012 22:57:00 +0100,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
> 
> > SQLCipher is a fork of SQLite that adds AES encryption using OpenSSL.
> > It relies on tcl to generate some of its source code, so host-tcl is
> > required.
> 
> The dependency on host-tcl is missing, no?

 Duh, thanks for noticing.

 Resending together with a more verbose tcl commit message.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
