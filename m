From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 02 Nov 2012 23:32:44 +0100
Subject: [Buildroot] [PATCH 2/2] legal-info: split _LICENSE and
 _REDISTRIBUTE constants
In-Reply-To: <1351848341-5905-3-git-send-email-luca@lucaceresoli.net>
References: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
 <1351848341-5905-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <50944A0C.4000900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/12 10:25, Luca Ceresoli wrote:
> Currently packages can be described in two ways: proprietary (tarball not
> saved, license not described in further detail), and others (tarball
> saved, license described).
>
> Split the logic to allow the license to be always described whether or not
> the source code can be redistributed.
>
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(untested)

  Pending the discussion at the BR developer days, of course; my ack is just
concerning the implementation.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
