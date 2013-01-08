From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 23:54:33 +0100
Subject: [Buildroot] [PATCH 01/28] x11r7: move X.org server style option
In-Reply-To: <909b81d257e7f2f45760325cbd316bc8b66320cf.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <909b81d257e7f2f45760325cbd316bc8b66320cf.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50ECA3A9.6030603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/13 22:29, Thomas Petazzoni wrote:
> The selection between "modular" server and "Kdrive" server really
> belongs as a sub-option of the X.org server itself, rather than as a
> global x11r7 option. So we move it under the X.org server option.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
