From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 23:33:44 +0200
Subject: [Buildroot] [PATCH 0/4] Wayland/weston packages
In-Reply-To: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5175ACB8.4060405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 18:07, Thomas Petazzoni wrote:
> Note that the first patch does something a little bit ugly: it moves
> xkeyboard-config outside of the if BR2_PACKAGE_XORG7 ... endif clause,
> because we also need it for Wayland/Weston. The consequence is that it
> now appears "alone" right after the "X.org system" submenu in
> menuconfig, which is not entirely nice. Suggestions welcome.

  Maybe moving it into "X libraries and helper libraries" is more 
relevant? I expect that other packages (mesa3d?) may also move there.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
