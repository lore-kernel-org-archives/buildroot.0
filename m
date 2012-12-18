From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 11:06:18 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <1232481150.1002440.1355759448787.JavaMail.root@advansee.com>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <1232481150.1002440.1355759448787.JavaMail.root@advansee.com>
Message-ID: <50D0401A.5020505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 16:50, Beno?t Th?baudeau wrote:
> This looks good. There is however a missing runtime dependency on firmware-imx.

  You only need that firmware when running a vpu encoder or decoder.

  Forcing a select seems like a bad idea.  Instead, I'll add a comment in 
the help text of the gst plugins that you need the firmware as well.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
