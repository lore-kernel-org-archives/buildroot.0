From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 23:56:35 +0100
Subject: [Buildroot] [PATCH 05/28] xserver_xorg-server: rename
 server-style configuration options
In-Reply-To: <76ec7a633a6ad539eb9a2c06fcf54d6c622febfe.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <76ec7a633a6ad539eb9a2c06fcf54d6c622febfe.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50ECA423.5080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/13 22:29, Thomas Petazzoni wrote:
> The BR2_PACKAGE_XSERVER_xorg and BR2_PACKAGE_XSERVER_tinyx options
> used to select the style of X.org server to use are not named
> consistently with the rest of the Buildroot options (in capital
> letters and prefixed with the package name).
>
> Therefore, we rename those options, and we take care to add the old
> option names in the BR2_LEGACY infrastructure.
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
