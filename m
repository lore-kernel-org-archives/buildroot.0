From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 07:58:04 +0100
Subject: [Buildroot] [PATCH] allow wpa_supplicant to run on the dbus
 using the 'new' api
In-Reply-To: <CAEnpE0yDTQWpUf9ctGnfuSjX8PR0uX6UcxzvdV6D6uoxrAg1zQ@mail.gmail.com>
References: <CAEnpE0yDTQWpUf9ctGnfuSjX8PR0uX6UcxzvdV6D6uoxrAg1zQ@mail.gmail.com>
Message-ID: <50D013FC.7040503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 21:54, Gary Coulbourne wrote:
> When wpa_supplicant is built, it compiles to use the old names on the
> dbus, as well as with the wrong executable name in the dbus activation
> service.
>
> This patch builds on a patch submitted in Sept by Sven Neumann.

  Hi Gary,

  Reviewing patches is more convenient for us if you do the following:

* Send the patch in-line, preferably with git send-email, so we can give 
comments in-line.

* Keep the original patch comment if it is still appropriate.

* Make sure the patch is called PATCHv2 or similar by sending with 'git 
send-email --subject-prefix=PATCHv2'.

* Include a changelog in the patch. It should come below the 
Signed-off-by line(s), seperated by
---
and it should explain which changes were made and why.

* Keep the original author information - in this case, preferably by 
keeping the original git authorship.


  I did a quick comparison with Sven's patch and I don't see why you 
removed the BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD option.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
