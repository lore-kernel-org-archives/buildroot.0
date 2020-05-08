From: Kunal Chauhan <atkunalchauhan@gmail.com>
Date: Fri, 8 May 2020 21:49:56 +0530
Subject: [Buildroot] Help: build-root compile and debug
In-Reply-To: <CACEFAc1m9d5+d3DrmOQLFPmQZ_4btapSU05vaAOSLTbM6HVrRQ@mail.gmail.com>
References: <CACEFAc0u58WHf7=ke1iAKP1+ftvr52yEnq8DHiufdJy4rNKKwQ@mail.gmail.com>
 <CACEFAc1TJwomj5_GN+rmxDZ5VKHoTkAF19r4tJJTQQ_VeeHMaw@mail.gmail.com>
 <CACEFAc0BAoQM_zPxCU17GQzca23fV8QtKe8yFryHWj1K1xYu9Q@mail.gmail.com>
 <CACEFAc0v5298rW08semTtB82ozxyv-gq9dmCOUeD8uU53m6ang@mail.gmail.com>
 <CACEFAc2_WcHo-VKKf-Z4fx=VyKzMCC+XSNZ=zApimtjFGxMtrQ@mail.gmail.com>
 <CACEFAc2YQvotkjCmRZJHaETQoEK7OYW4oqqq_mpM_6YEJzZFgQ@mail.gmail.com>
 <CACEFAc3xWYYLMmxcJYfSqwHmpWwf4hKSPOG5UGgwr9OHmtgY6g@mail.gmail.com>
 <CACEFAc1m9d5+d3DrmOQLFPmQZ_4btapSU05vaAOSLTbM6HVrRQ@mail.gmail.com>
Message-ID: <CACEFAc21hKusY2LPZojBJe+HBYws5EKy=_ar4Lm7k-b7W1vRxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Team,,

1. What is the realtion between build root and busy box. ? Not clear to me

2.As we compile whole linux some build output comes in case of busy box
also if am not wrong.

So will it be  a firmware image , if yes then  will it can  contain
multiple  binaries.

3. If point 2 is yes , if one of user binary crash what will be the way to
find crash point in that binaries.




Thanks
Kunal


On 8 May 2020 15:24, <buildroot-request@busybox.net> wrote:

Send buildroot mailing list submissions to
        buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
        http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
        buildroot-request at busybox.net

You can reach the person managing the list at
        buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific
than "Re: Contents of buildroot digest..."


Today's Topics:

   1. [git commit] package/apparmor: replace deprecated egrep with
      grep -E (Yann E. MORIN)
   2. Re: [PATCH] package/uacme: bump version to 1.2.3 (Peter Korsgaard)
   3. Re: [PATCH 2/5] package/apparmor: fix compatibility with
      busybox grep (Yann E. MORIN)
   4. Re: [PATCH 1/5] package/apparmor: replace deprecated egrep
      with grep -E (Yann E. MORIN)
   5. [git commit] package/domoticz: set WITH_LIBUSB (Yann E. MORIN)
   6. Re: [PATCH v2 1/1] package/freescale-imx/imx-gpu-g2d: fix the
      file name (Peter Korsgaard)
   7. [git commit branch/2020.02.x] package/midori: needs gcc >= 7
      (Peter Korsgaard)
   8. [git commit branch/2020.02.x] {linux, linux-headers}: bump
      4.{4, 9, 14, 19}.x / 5.{4, 5, 6}.x series (Peter Korsgaard)
   9. [git commit branch/2020.02.x] package/python: bump version to
      2.7.18 (Peter Korsgaard)
  10. [git commit branch/2020.02.x] package/python-jedi: add
      missing license (Peter Korsgaard)
  11. [git commit branch/2020.02.x]
      package/freescale-imx/imx-gpu-g2d: fix the file name for ARM
      (Peter Korsgaard)
  12. [git commit branch/2020.02.x] package/openjdk: Remove sparc
      support (Peter Korsgaard)
  13. [git commit branch/2020.02.x] package/openjdk: copy all
      directories and files when installing (Peter Korsgaard)
  14. [git commit branch/2020.02.x] package/libglib2: restore use
      of system printf (Peter Korsgaard)
  15. [git commit branch/2020.02.x] package/openjdk: fix
      installation with merged usr directories (Peter Korsgaard)
  16. Re: .br2-external files (Yann E. MORIN)
  17. Re: [PATCH] package/binutils: fix XTENSA_NDIFF handling for
      PR ld/25861 (Max Filippov)
  18. [PATCH] release: don't include temp files (Yann E. MORIN)
  19. Re: [PATCH 1/1] package/domoticz: set WITH_LIBUSB (Yann E. MORIN)
  20. [PATCH] package/gcc: remove powerpc conditional patch
      (Romain Naour)
  21. [PATCH 1/1] package/c-icap: fix musl build (Fabrice Fontaine)
  22. [Bug 12841] util-linux/sfdisk 2.35.1 fails on sector-size
      header (bugzilla at busybox.net)
  23. Re: [PATCH] release: don't include temp files (Peter Korsgaard)
  24. [git commit] release: don't include temp files (Peter Korsgaard)
  25. Re: [PATCH] package/binutils: fix xtensa PR ld/25861
      (Peter Korsgaard)
  26. Re: [PATCH] package/binutils: fix XTENSA_NDIFF handling for
      PR ld/25861 (Peter Korsgaard)
  27. Re: [PATCH 1/1] package/evtest: switch to Gitlab (Peter Korsgaard)
  28. [PATCH 1/1] configs/globalscale_espressobin: new defconfig
      (Joachim Nilsson)
  29. Re: [PATCH] package/apache: fixing apxs path mangling
      (Peter Korsgaard)
  30. Re: [git commit] package/wireguard-linux-compat: depend on
      headers < 5.6 (Peter Korsgaard)
  31. Re: [git commit] package/wireguard-linux-compat: tweak
      kernel-headers < 5.6 logic (Peter Korsgaard)
  32. Re: [PATCH 1/1] fs/cpio: make initramfs init script survive
      'console=' kernel argument (Peter Korsgaard)
  33. [git commit branch/2020.02.x] package/wireguard-linux-compat:
      tweak kernel-headers < 5.6 logic (Peter Korsgaard)
  34. [git commit branch/2020.02.x] package/apache: fixing apxs
      path mangling (Peter Korsgaard)
  35. [git commit branch/2020.02.x] package/wireguard-linux-compat:
      depend on headers < 5.6 (Peter Korsgaard)
  36. [git commit branch/2020.02.x] package/binutils: fix
      XTENSA_NDIFF handling for PR ld/25861 (Peter Korsgaard)
  37. [git commit branch/2020.02.x] package/evtest: switch to
      Gitlab (Peter Korsgaard)
  38. [git commit branch/2020.02.x] fs/cpio: make initramfs init
      script survive 'console=' kernel argument (Peter Korsgaard)
  39. [git commit branch/2020.02.x] package/binutils: fix xtensa PR
      ld/25861 (Peter Korsgaard)


----------------------------------------------------------------------

Message: 1
Date: Fri, 8 May 2020 09:58:22 +0200
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit] package/apparmor: replace deprecated
        egrep with grep -E
Message-ID: <20200508075218.CC7D690FD0@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6569d76aeaf47
26359166b429bf42e54ec9ce71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit: 5f46dedd6e8109d845af118b36039a5d7dd05af9

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0002-replace-deprecated-egrep-with-grep-e.patch | 28
++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
new file mode 100644
index 0000000000..4caefe447b
--- /dev/null
+++ b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
@@ -0,0 +1,28 @@
+From 5f46dedd6e8109d845af118b36039a5d7dd05af9 Mon Sep 17 00:00:00 2001
+From: Christian Boltz <apparmor@cboltz.de>
+Date: Mon, 18 Mar 2019 19:17:16 +0100
+Subject: [PATCH] replace deprecated egrep with grep -e
+
+(cherry picked from commit 5f46dedd6e8109d845af118b36039a5d7dd05af9)
+Signed-off-by: Christian Boltz <apparmor@cboltz.de>
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ parser/rc.apparmor.functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
+index 22e8367..f3108f8 100644
+--- a/parser/rc.apparmor.functions
++++ b/parser/rc.apparmor.functions
+@@ -129,7 +129,7 @@ skip_profile() {
+            "${profile%.pacnew}" != "${profile}" ] ; then
+               return 2
+       fi
+-      if echo "${profile}" | egrep -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
++      if echo "${profile}" | grep -E -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
+               return 2
+       fi
+
+--
+2.26.2
+


------------------------------

Message: 2
Date: Fri, 08 May 2020 10:11:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] package/uacme: bump version to 1.2.3
Message-ID: <87mu6isv6z.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > This version fixes https://github.com/ndilieto/uacme/issues/22
 > Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

Does that also affect the 1.0.21 version we have in 2020.02.x? If so,
what is the impact? Do we need to update to 1.2.3 or cherry pick a
patch?

-- 
Bye, Peter Korsgaard


------------------------------

Message: 3
Date: Fri, 8 May 2020 10:11:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Cc: Adam Duskett <aduskett@gmail.com>, Buildroot Mailing List
        <buildroot@buildroot.org>, Angelo Compagnucci
        <angelo.compagnucci@gmail.com>, Maxime Hadjinlian
        <maxime.hadjinlian@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/5] package/apparmor: fix
        compatibility with busybox grep
Message-ID: <20200508081137.GJ12536@scaer>
Content-Type: text/plain; charset=utf-8

Adam, Angelo, All,

On 2020-05-08 08:32 +0200, Angelo Compagnucci spake thusly:
> On Fri, May 8, 2020 at 4:00 AM <aduskett@gmail.com> wrote:
> >
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > The following regex string in rc.apparmor.functions
> > "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken
due to
> > the unescaped { at the end of the regex pattern.
> > GNU grep ignors the error. However, the Busybox grep does not and
throws the
> > error "unescaped character {"
>
> Indeed, my original series had:
> select BR2_PACKAGE_GREP
> to overcome this issue but it went somewhat missing.

I dropped it in my rework of the series, because there was no
explanations why it was needed.

In the end, I did apply Adam's patch, because:
  - it is simple enough and correct,
  - we will notice it no longer applies when we bump the version, and so
    can drop it.

If we 'd have gone for selecting the full grep, we would not have
noticed that it would no longer needed when we update, later.

Thanks.

Regards,
Yann E. MORIN.

> > Escape the "{" character to fix this issue.
> >
> > Note: Upstream has rewritten large sections of the
rc.apparmor.functions file
> > and the function this patch fixes will no longer be necessary after the
next
> > version is released. However, it is not possible to easily backport the
> > upstream patches as the rewrite comes with new features that would not
be
> > possible with a simple patch such as this one.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  ...apparmor.functions-to-work-with-busy.patch | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 package/apparmor/0003-fix-rege
x-in-rc.apparmor.functions-to-work-with-busy.patch
> >
> > diff --git a/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-
to-work-with-busy.patch
> > new file mode 100644
> > index 0000000000..54afcd43a8
> > --- /dev/null
> > +++ b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-
to-work-with-busy.patch
> > @@ -0,0 +1,37 @@
> > +From 12764faa0a01bcc4e0ffc92ce308985dbad0d954 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Aduskett@gmail.com>
> > +Date: Thu, 7 May 2020 18:25:29 -0700
> > +Subject: [PATCH] fix regex in rc.apparmor.functions to work with
busybox
> > +
> > +The following regex string in rc.apparmor.functions
> > +"^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is
broken due to
> > +the unescaped {. GNU grep ignores the error. However, the Busybox grep
does
> > +not and throws the error "unescaped character {"
> > +
> > +Escape the "{" character to fix this issue.
> > +
> > +Note: Upstream has rewritten large sections of the
rc.apparmor.functions file
> > +and the function this patch fixes will no longer be necessary after
the next
> > +version is released.
> > +
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + parser/rc.apparmor.functions | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/parser/rc.apparmor.functions
b/parser/rc.apparmor.functions
> > +index f3108f8..db0697c 100644
> > +--- a/parser/rc.apparmor.functions
> > ++++ b/parser/rc.apparmor.functions
> > +@@ -140,7 +140,7 @@ force_complain() {
> > +       local profile=$1
> > +
> > +       # if profile not in complain mode
> > +-      if ! egrep -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[
\t]*\)[ \t]+{" $profile ; then
> > ++      if ! grep -E -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[
\t]*\)[ \t]+\{" $profile ; then
> > +               local link="${PROFILE_DIR}/force-complain/`basename
${profile}`"
> > +               if [ -e "$link" ] ; then
> > +                       aa_log_warning_msg "found $link, forcing
complain mode"
> > +--
> > +2.26.2
> > +
> > --
> > 2.26.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.-
-------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
   |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
'------------------------------^-------^------------------^-
-------------------'


------------------------------

Message: 4
Date: Fri, 8 May 2020 10:14:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: aduskett at gmail.com
Cc: buildroot at buildroot.org, Maxime Hadjinlian
        <maxime.hadjinlian@gmail.com>, Angelo Compagnucci
        <angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/5] package/apparmor: replace
        deprecated egrep with grep -E
Message-ID: <20200508081449.GK12536@scaer>
Content-Type: text/plain; charset=utf-8

Adam, All,

On 2020-05-07 18:59 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
>
> Upstream commit: 5f46dedd6e8109d845af118b36039a5d7dd05af9
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Patches 1-4 applied to master, thanks. See a few replies to patch 2 and 4.

I've not (yet) applied patch 5, because it is sitting somewhere between
being a feature-patch and being a fix. If is a feature-patch because it
allows building systemnd with apparmor support, while it is a fix
because it guarantees build ordering now... So saying I'm torn onthat
one is a bit strong, but still I am not sure either...

Regards,
Yann E. MORIN.

> ---
>  ...replace-deprecated-egrep-with-grep-e.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/apparmor/0002-replace-
deprecated-egrep-with-grep-e.patch
>
> diff --git a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
> new file mode 100644
> index 0000000000..4caefe447b
> --- /dev/null
> +++ b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
> @@ -0,0 +1,28 @@
> +From 5f46dedd6e8109d845af118b36039a5d7dd05af9 Mon Sep 17 00:00:00 2001
> +From: Christian Boltz <apparmor@cboltz.de>
> +Date: Mon, 18 Mar 2019 19:17:16 +0100
> +Subject: [PATCH] replace deprecated egrep with grep -e
> +
> +(cherry picked from commit 5f46dedd6e8109d845af118b36039a5d7dd05af9)
> +Signed-off-by: Christian Boltz <apparmor@cboltz.de>
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + parser/rc.apparmor.functions | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
> +index 22e8367..f3108f8 100644
> +--- a/parser/rc.apparmor.functions
> ++++ b/parser/rc.apparmor.functions
> +@@ -129,7 +129,7 @@ skip_profile() {
> +          "${profile%.pacnew}" != "${profile}" ] ; then
> +             return 2
> +     fi
> +-    if echo "${profile}" | egrep -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
> ++    if echo "${profile}" | grep -E -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
> +             return 2
> +     fi
> +
> +--
> +2.26.2
> +
> --
> 2.26.2
>

-- 
.-----------------.--------------------.------------------.-
-------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
   |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
'------------------------------^-------^------------------^-
-------------------'


------------------------------

Message: 5
Date: Fri, 8 May 2020 10:15:40 +0200
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit] package/domoticz: set WITH_LIBUSB
Message-ID: <20200508080012.A140B90FD4@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a896be19de9e6
e7845b24af497fead6f522ef67d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use WITH_LIBUSB which is available since version 4.9700 and
https://github.com/domoticz/domoticz/commit/f53817577a834ed0
c3fc16458c374aea490be49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 5efe86a784..0ceaab87b4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -38,6 +38,9 @@ DOMOTICZ_CONF_OPTS += \

 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
+else
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif

 ifeq ($(BR2_PACKAGE_OPENZWAVE),y)


------------------------------

Message: 6
Date: Fri, 08 May 2020 10:17:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Timo Ketola <timo.ketola@exertus.fi>
Cc: buildroot at buildroot.org, Gary Bisson <bisson.gary@gmail.com>,
        Refik Tuzakli <tuzakli.refik@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1]
        package/freescale-imx/imx-gpu-g2d: fix the file name
Message-ID: <87imh6suvt.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Timo" == Timo Ketola <timo.ketola@exertus.fi> writes:

 > NXP apparently changed file naming convention for this particular file.
 > Fixes:
 > 1d0ea8d433 (package/freescale-imx/imx-gpu-g2d: bump to version
6.4.0.p1.0)

 > Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
 > ---
 > Changes v1 -> v2:

 >  - Add 'Fixes:' line as suggested by Gary

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 7
Date: Fri, 8 May 2020 09:13:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/midori:
        needs gcc >= 7
Message-ID: <20200508080227.4B9DE90FE3@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbc2f26d06e3f
45c2fe316c6fad0fc18a275e9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4 forgot to propagate
gcc >= 7 dependency to midori

Fixes:
 - http://autobuild.buildroot.org/results/736a99dcaa72fba3f0677
5d08c4395f506fce944

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de5a74193b270e4bff19a45a4b82a70fb70857fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/midori/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 64139ce49e..089f36ced8 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
        depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-               !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+               !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
                !BR2_TOOLCHAIN_USES_GLIBC

 config BR2_PACKAGE_MIDORI
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MIDORI
        depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr,
gnupg2
        depends on BR2_PACKAGE_LIBGTK3
        depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
        depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
        depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
        # GCR can only be used with the X11 backend


------------------------------

Message: 8
Date: Fri, 8 May 2020 10:05:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
        linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 5, 6}.x series
Message-ID: <20200508080227.8328B90FE4@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3788e762d802e
d6d61f65e7bf757f046592b627b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Notice: 5.5.x is now EOL, so should be dropped at the next version bump.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.5.x / 5.6.x bump]
(cherry picked from commit 72a6e50da9585d632e70c3f668857f45601088fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c367b33378..bdf3c26326 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif

 config BR2_LINUX_KERNEL_VERSION
        string
-       default "5.4.31" if BR2_LINUX_KERNEL_LATEST_VERSION
+       default "5.4.35" if BR2_LINUX_KERNEL_LATEST_VERSION
        default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
        default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT
_VERSION
        default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f6bad5c8ec..3226a2fafb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 <https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc-sha256>
a11083f8f809887f6a0f8d4467532385b99418f17998fe6e837807491c276eeb
linux-5.4.31.tar.xz
+sha256  e16bd5f7284a80a41328bf712e1136b0adf5b71cc0bd263efa7cac75539806d4
linux-5.4.35.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 <https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc-sha256>
ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063
linux-4.4.218.tar.xz
-sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd
linux-4.9.218.tar.xz
-sha256  cb440ac5d20071dcb482e5062958514064b0c5a8375c92653062ea201ae0222c
linux-4.14.175.tar.xz
-sha256  1e40a0dc6afc95a259f97b80d5f5ef8f89e2ee49e993ba6844e2bc55de361f0e
linux-4.19.114.tar.xz
+sha256  4e98b51c2e3a8fd069dc941b9cb68594f84ea767c2927e93255e1151c5c2fdd6
linux-4.4.219.tar.xz
+sha256  6b17238cced3e1c2753d6d5b4f662bd347d4651f07c35506b849eb10aea7bc44
linux-4.9.219.tar.xz
+sha256  bcae0956baaeb55dab5bad0401873fbc5baaa7fbe957ea6d27a5ab241cec5ca2
linux-4.14.176.tar.xz
+sha256  89749365f9dafa6c62cc5e920a7e532ed4aad9ab766fb436423b153ffbc08c96
linux-4.19.118.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2
linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280
linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host
b/package/linux-headers/Config.in.host
index fde769e6a3..598d5a8853 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice

 config BR2_DEFAULT_KERNEL_HEADERS
        string
-       default "4.4.218"       if BR2_KERNEL_HEADERS_4_4
-       default "4.9.218"       if BR2_KERNEL_HEADERS_4_9
-       default "4.14.175"      if BR2_KERNEL_HEADERS_4_14
-       default "4.19.114"      if BR2_KERNEL_HEADERS_4_19
-       default "5.4.31"        if BR2_KERNEL_HEADERS_5_4
+       default "4.4.219"       if BR2_KERNEL_HEADERS_4_4
+       default "4.9.219"       if BR2_KERNEL_HEADERS_4_9
+       default "4.14.176"      if BR2_KERNEL_HEADERS_4_14
+       default "4.19.118"      if BR2_KERNEL_HEADERS_4_19
+       default "5.4.35"        if BR2_KERNEL_HEADERS_5_4
        default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
        default "custom"        if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
        default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \


------------------------------

Message: 9
Date: Fri, 8 May 2020 10:06:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/python:
        bump version to 2.7.18
Message-ID: <20200508080227.976C690FE3@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6105fcaca3445
fd1c69c3f80ec85017dbdb136c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://pythoninsider.blogspot.com/2020/04/python-2718-last-
release-of-python-2.html

Updated license hash due to upstream commit:
https://github.com/python/cpython/commit/aa5b196c180d4c1dbe5
a8593e55066e630d38c09

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3586b0703fa9a8b4138ac4bf9e274c7f1bef2e6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.hash | 8 ++++----
 package/python/python.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python/python.hash b/package/python/python.hash
index aa809b9a61..f5e51d9638 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-2717/
-md5 b3b6d2c92f42a60667814358ab9f0cfd Python-2.7.17.tar.xz
+# From https://www.python.org/downloads/release/python-2718/
+md5  fd6cc8ec0a78c44036f825e739f36e5a Python-2.7.18.tar.xz
 # Locally calculated
-sha256 4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41
Python-2.7.17.tar.xz
-sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c
LICENSE
+sha256  b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43
Python-2.7.18.tar.xz
+sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23
LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
index 1c393b255d..532c372dee 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ###########################################################
#####################

 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).17
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).18
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others


------------------------------

Message: 10
Date: Fri, 8 May 2020 10:06:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x]
        package/python-jedi: add missing license
Message-ID: <20200508080227.8D5D990FE3@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=279eddff6515c
00e9633342895684f7540c365a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

python-jedi bundles its own copy of typeshed since version 0.14.0 and
https://github.com/davidhalter/jedi/commit/7d2b7bb3c1c4f79f3
25ccbde9d2b2734aa872312

So add it to the license files (and update indentation of hash file to
two spaces while at it)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab98c1ffb65b10ede668356014481f63ac9a72e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jedi/python-jedi.hash | 9 +++++----
 package/python-jedi/python-jedi.mk   | 5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash
b/package/python-jedi/python-jedi.hash
index 1fc3a3da50..77af6e79f3 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5    ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
-sha256 ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e
jedi-0.15.1.tar.gz
+md5  ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
+sha256  ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e
jedi-0.15.1.tar.gz
 # Locally computed sha256 checksums
-sha256 78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412
LICENSE.txt
-sha256 9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e
docs/_themes/flask/LICENSE
+sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412
LICENSE.txt
+sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e
docs/_themes/flask/LICENSE
+sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0
jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/
python-jedi.mk
index e11146def7..4e756a709c 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -8,7 +8,8 @@ PYTHON_JEDI_VERSION = 0.15.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
 PYTHON_JEDI_SITE = https://files.pythonhosted.org
/packages/85/03/cd5a6e44a5753b4d539288d9d1f9645caac889c17dd2950292a8818f86b2
 PYTHON_JEDI_SETUP_TYPE = setuptools
-PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme)
-PYTHON_JEDI_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE
+PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme), Apache-2.0
(typeshed)
+PYTHON_JEDI_LICENSE_FILES = \
+       LICENSE.txt docs/_themes/flask/LICENSE
jedi/third_party/typeshed/LICENSE

 $(eval $(python-package))


------------------------------

Message: 11
Date: Fri, 8 May 2020 10:17:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x]
        package/freescale-imx/imx-gpu-g2d: fix the file name for ARM
Message-ID: <20200508080227.A896A90F63@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ac9faa318ea2
dd6b82d0ea95a446ed74647edc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

NXP apparently changed file naming convention for this particular file.

Fixes: 1d0ea8d433 (package/freescale-imx/imx-gpu-g2d: bump to version
6.4.0.p1.0)
Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd3dc5b4fa59bdb14c3b5f1b46b9a4466982b03b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 8ecfbfe40f..98ca7fbe7e 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2
imx-gpu-g2d-6.4.0.p1.0-aarch32.bin
+sha256 6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2
imx-gpu-g2d-6.4.0.p1.0-arm.bin
 sha256 35885f435dbe951d2c0f439a376ed8a59a50b67a1b7e1e14fa2ab03995abb1ad
imx-gpu-g2d-6.4.0.p1.0-aarch64.bin
 sha256 d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561
COPYING
 sha256 9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7
EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 6598e4c32b..7700170970 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -7,7 +7,7 @@
 ifeq ($(BR2_aarch64),y)
 IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch32
+IMX_GPU_G2D_VERSION = 6.4.0.p1.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin


------------------------------

Message: 12
Date: Fri, 8 May 2020 09:26:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjdk:
        Remove sparc support
Message-ID: <20200508080227.789D090FE3@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e00fb25061693
7d92d1735c398c14e301c462107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Sparc support is deprecated and may be removed in future releases. There are
two choices to fix this issue:

1) Set --enable-deprecated-ports=yes in the CONF_OPTS to supress the error.
2) Remove support for Sparc.

Because this port is deprecated, it's safer to remove support alltogether.

Fixes:
    http://autobuild.buildroot.net/results/692820b4b6d4da42cd557
fa7badbbd11806bbeba/

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ee7de3d2f0a9c33622008a10b65db019e2cfa3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 61294ec49f..df769bbb35 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
        default y if BR2_m68k
        default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
        default y if BR2_sh
-       default y if BR2_sparc || BR2_sparc64

 config BR2_PACKAGE_OPENJDK
        bool "openjdk"


------------------------------

Message: 13
Date: Fri, 8 May 2020 09:23:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjdk:
        copy all directories and files when installing
Message-ID: <20200508080227.6E99A90FE4@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0282033f42d43
60b0f379cf01f12c1155d957f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Several directories and files are currently not installed during the
target installation, these include:
  - conf
    Several configuration files, including security configuration files
which
    may be necessary for running various java applications.

  - legal
    This directory contains legal notices that some java applications may
    require, as they may print legal information and will throw exceptions
at
    runtime if the legal files are not present on the system.

  - release
    This file contains a list of modules included in the image.

Because these directories take up less than of megabyte extra, it is not an
issue to install all of them.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 63b576095b1dbabaf15a6eee7ceabed6d868a707)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/openjdk.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e58757b2ed..1f906517fe 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -123,9 +123,7 @@ endef
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
-       cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
-               $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
-       cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
+       cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
                $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
        cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/*
.
 endef


------------------------------

Message: 14
Date: Fri, 8 May 2020 09:15:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/libglib2:
        restore use of system printf
Message-ID: <20200508080227.554CD90F63@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6808e122f6ae9
cca3966877e865e35b8922a9e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Prior to commit 4102db0f7a ("package/libglib2: bump to version 2.60.3")
which converted libglib2 to meson, Buildroot used to set a range of
autoconf options to bypass tests that require running binaries.

The meson version of libglib2's build system has many fewer of these
checks, but there are still some and these can be fed the "correct"
answer by adding properties to cross-compilation.conf.

Add the necessary properties to indicate that we have C99 compliant
print functions to avoid pulling in the gnulib fallback.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f91198f0d878adee4f3fd6c6991879c1255951a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f00818f69c..a206639f74 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -52,6 +52,11 @@ LIBGLIB2_CONF_OPTS = \
        -Dinstalled_tests=false \
        -Doss_fuzz=disabled

+LIBGLIB2_MESON_EXTRA_PROPERTIES = \
+       have_c99_vsnprintf=true \
+       have_c99_snprintf=true \
+       have_unix98_printf=true
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif


------------------------------

Message: 15
Date: Fri, 8 May 2020 09:21:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjdk:
        fix installation with merged usr directories
Message-ID: <20200508080227.60EBF90FE3@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f61ae43370371
1952dc3a230e71532d110c4e899
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Currently, Buildroot installs the jre libraries using
cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/

However, if a system has a merged /usr directory, and there is a built
kernel
before installing OpenJDK, the installation fails because jre/lib has binary
modules file, which causes the following error: cp: cannot overwrite
directory
'/usr/lib/modules with non-directory

The obvious fix is to install the modules to /usr/lib/jvm/ and set the
appropriate rpaths via the --with-extra-ldflags conf option. However, this
fix
does not work because the built binaries themselves do not link against
libjava.so

Indeed, running readelf on the built java binary reports the following:
"(RUNPATH) Library runpath: [/usr/lib/jvm]" and /usr/lib/jvm/libjava.so
exists.
However, when running the Java binary on the target, the following error
occurs: "Error: could not find libjava.so."

The following is the result of "strace java" ran on the target:
faccessat(AT_FDCWD, "/usr/lib/libjava.so", F_OK) = -1 ENOENT
faccessat(AT_FDCWD, "/usr/jre/lib/libjava.so", F_OK) = -1 ENOENT
newfstatat(AT_FDCWD, "/usr/lib/libjava.so", 0x7ffe7b4af8, 0) = -1 ENOENT
newfstatat(AT_FDCWD, "/usr/lib/jvm/libjli.so", [sic] AT_SYMLINK_NOFOLLOW) =
0

As seen above, the java binary searches for libjli.so in /usr/lib/jvm,
which demonstrates that the java binary searches for some of the
DT_NEEDED libraries using the correct rpath. But libjava.so is not
searched from the rpath; it is instead dl-opened manually, looked for in
the search paths hardcoded to the following directories:
  - /usr/lib/
  - /usr/jre/lib/
  - $(dirname $0)/../lib/

The reason behind the hardcoded paths given by the maintainers is due to
historical purposes for the need to support several java versions at the
same time on a single system, and that changing the above behavior is not
likely to ever happen.

As such, most distributions such as Redhat do the following:
  - Create the directory /usr/lib/jvm/java-$(JAVA_VERSION)/
  - Install all directories and files found in images/jre to that directory.
  - Symlink the binaries to in /usr/lib/jvm/java-$(JAVA_VERSION)/bin to
    /usr/bin.

However, because Buildroot does not need to support multiple versions of
java
concurrently, there is no need for the additional java-$(JAVA_VERSION)
directory.

To fix the above issue, the following changes are performed:
  - Introduce the variable "OPENJDK_INSTALL_BASE" which points to
/usr/lib/jvm
  - Set the --with-extra-ldflags conf_opt to
      "-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/lib,-rpath,
      $(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)"
  - Run "mkdir -p $(TARGET_DIR)/usr/lib/jvm/" in the INSTALL_TARGET_CMDS
step.
  - Copy both the lib and bin directories to /usr/lib/jvm/
  - Symlink the binaries in /usr/lib/jvm/bin/ to /usr/bin.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12751

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
[yann.morin.1998 at free.fr: fix two remaining mis-placed '/']
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3edb915709dec21158542b15e62f1560b8dc2fa2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/openjdk.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 030a205228..e58757b2ed 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -46,6 +46,13 @@ OPENJDK_JVM_VARIANT = zero
 OPENJDK_DEPENDENCIES += libffi
 endif

+# OpenJDK installs a file named 'modules' in jre/lib, which gets installed
as
+# /usr/lib/modules. However, with a merged /usr, this conflicts with the
+# directory named 'modules' installed by the kernel. If OpenJDK gets built
+# after the kernel, this manifests itself with: "cp: cannot overwrite
+# directory '/usr/lib/modules with non-directory."
+OPENJDK_INSTALL_BASE = /usr/lib/jvm
+
 # OpenJDK ignores some variables unless passed via the environment.
 # These variables are PATH, LD, CC, CXX, and CPP.
 # OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
@@ -75,6 +82,7 @@ OPENJDK_CONF_OPTS = \
        --with-devkit=$(HOST_DIR) \
        --with-extra-cflags="$(TARGET_CFLAGS)" \
        --with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
+       --with-extra-ldflags="-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/li
b,-rpath,$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)" \
        --with-giflib=system \
        --with-jobs=$(PARALLEL_JOBS) \
        --with-jvm-variants=$(OPENJDK_JVM_VARIANT) \
@@ -114,8 +122,12 @@ endef
 # Calling make install always builds and installs the JDK instead of the
JRE,
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
-       cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/*
$(TARGET_DIR)/usr/bin/
-       cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/*
$(TARGET_DIR)/usr/lib/
+       mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
+       cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
+               $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
+       cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
+               $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
+       cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/*
.
 endef

 $(eval $(generic-package))


------------------------------

Message: 16
Date: Fri, 8 May 2020 10:27:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danomi Manchego <danomimanchego123@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] .br2-external files
Message-ID: <20200508082713.GL12536@scaer>
Content-Type: text/plain; charset=utf-8

Danomi, All,

On 2020-05-04 17:04 -0400, Danomi Manchego spake thusly:
> Hi all,
>
> I noticed that the
> https://buildroot.org/downloads/buildroot-2020.02.1.tar.bz2 has these
> files in it:
>
> $ ls -1 .br2*
> .br2-external.in.jpeg
> .br2-external.in.menus
> .br2-external.in.openssl
> .br2-external.in.paths
> .br2-external.in.toolchains
> .br2-external.mk
>
> But when I look at the 2020.02.x tag in git, those files are not there.
> These are derived files, yes?  Are they expected to be in the release
tarball?

Indeed they should not be there. They should not be a problem in
practice, but this is not clean. I'll send a patch.

Thanks for the feedback,

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.-
-------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
   |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
'------------------------------^-------^------------------^-
-------------------'


------------------------------

Message: 17
Date: Fri, 8 May 2020 01:31:32 -0700
From: Max Filippov <jcmvbkbc@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Cc: buildroot <buildroot@buildroot.org>,  Thomas Petazzoni
        <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/binutils: fix XTENSA_NDIFF
        handling for PR ld/25861
Message-ID:
        <CAMo8BfKCYu9aSMn-3F2Cy8Sj7nJvGo4eHzM=gx2QgUmQjGNTyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Romain,

On Thu, May 7, 2020 at 2:10 PM Romain Naour <romain.naour@gmail.com> wrote:
> It seems elf2flt used by qemu_xtensa_lx60_nommu_defconfig doesn't support
> R_XTENSA_PDIFF32:
>
>   elf2flt: 267 bad relocs
>
> https://gitlab.com/kubu93/buildroot/-/jobs/543293510

Thanks for the report. Proposed fix:
https://github.com/uclinux-dev/elf2flt/pull/18

-- 
Thanks.
-- Max


------------------------------

Message: 18
Date: Fri,  8 May 2020 10:32:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot at buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Danomi Manchego
        <danomimanchego123@gmail.com>, Peter Korsgaard <peter@korsgaard.com>
Subject: [Buildroot] [PATCH] release: don't include temp files
Message-ID: <20200508083220.18927-1-yann.morin.1998@free.fr>

When we prepare the release, we generate the manual in various formats,
so that it can be consulted locally without needing the miriads of tools
needed to generate it.

However, this creates the temporary .br2-external.* files in the output
directory, and those end up in the release tarball.

This is not a problem in practice, but is not clean.

Run 'distclean' in the output directory, to get rid of everything but
the generated documentation.

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3aa4ba4532..2da34b5305 100644
--- a/Makefile
+++ b/Makefile
@@ -1190,7 +1190,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
        git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
        $(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-       $(MAKE) O=$(OUT) clean
+       $(MAKE) O=$(OUT) distclean
        tar rf $(OUT).tar $(OUT)
        gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
        bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
-- 
2.20.1



------------------------------

Message: 19
Date: Fri, 8 May 2020 10:33:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: set WITH_LIBUSB
Message-ID: <20200508083307.GM12536@scaer>
Content-Type: text/plain; charset=utf-8

Fabrice, All,

On 2020-05-08 00:37 +0200, Fabrice Fontaine spake thusly:
> Use WITH_LIBUSB which is available since version 4.9700 and
> https://github.com/domoticz/domoticz/commit/f53817577a834ed0
c3fc16458c374aea490be49e
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/domoticz/domoticz.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> index 5efe86a784..0ceaab87b4 100644
> --- a/package/domoticz/domoticz.mk
> +++ b/package/domoticz/domoticz.mk
> @@ -38,6 +38,9 @@ DOMOTICZ_CONF_OPTS += \
>
>  ifeq ($(BR2_PACKAGE_LIBUSB),y)
>  DOMOTICZ_DEPENDENCIES += libusb
> +DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
> +else
> +DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
> --
> 2.26.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.-
-------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
   |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
'------------------------------^-------^------------------^-
-------------------'


------------------------------

Message: 20
Date: Fri,  8 May 2020 10:34:33 +0200
From: Romain Naour <romain.naour@gmail.com>
To: buildroot at buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Thomas Petazzoni
        <thomas.petazzoni@bootlin.com>
Subject: [Buildroot] [PATCH] package/gcc: remove powerpc conditional
        patch
Message-ID: <20200508083433.1313246-1-romain.naour@gmail.com>

We lost track the powerpc conditional patch that was added for gcc 4.3.3 [1]
and present up to gcc 4.9 (gcc 4.9 removed by [2]). But the code in gcc.mk
is still present.

The patch was dropped starting gcc 5.1 [3] but it's know to be useful for
gcc 4.7.3 [4].

Since we used to have a patch directory (package/gcc/$(GCC_VERSION)) for
every gcc version available in Buildroot, the apply-patches.sh script
doesn't error out even if 1000-powerpc-link-with-math-lib.patch.conditional
is missing.

But with gcc 10, we don't need (for the moment) to apply any patch, so the
patch directory doesn't exist. apply-patches.sh break the build since
the patch directory is missing:

  Aborting.  'package/gcc/10.1.0' is not a directory.

Since we removed gcc 4.9 last year [2], we can safely remove this code.

Tested using qemu_ppc_virtex_ml507_defconfig.

[1] bb1f42e4426c432af60fc80da45c6daf7e31c1a0
[2] baf177502214a67619d9d0d6d0a780458e4d652d
[3] 4deb2d93c5ab317b6addf4e1e132571ba8dac031
[4] 197006a41c1a0450bf6350d5742e186b5b0c69de

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 50f2a3fcb7..af25d268a7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -32,14 +32,6 @@ endef
 # Apply patches
 #

-ifeq ($(ARCH),powerpc)
-ifneq ($(BR2_SOFT_FLOAT),)
-define HOST_GCC_APPLY_POWERPC_PATCH
-       $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION)
1000-powerpc-link-with-math-lib.patch.conditional
-endef
-endif
-endif
-
 # gcc is a special package, not named gcc, but gcc-initial and
 # gcc-final, but patches are nonetheless stored in package/gcc in the
 # tree, and potentially in BR2_GLOBAL_PATCH_DIR directories as well.
-- 
2.25.4



------------------------------

Message: 21
Date: Fri,  8 May 2020 11:01:08 +0200
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot at buildroot.org
Cc: Guillaume Gardet <guillaume.gardet@oliseo.fr>, Fabrice Fontaine
        <fontaine.fabrice@gmail.com>
Subject: [Buildroot] [PATCH 1/1] package/c-icap: fix musl build
Message-ID: <20200508090108.315450-1-fontaine.fabrice@gmail.com>

Commit cb5df2fea516d4861af3c0629f49df697ee4f70e wrongly removed the
first patch which is not in version 0.5.6. So add it back and update it
so that it applies cleanly.

Fixes:
 - http://autobuild.buildroot.org/results/ddb57462945c5c2340cc3
75aa6fe2848d13d7001

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ixes-to-compile-and-run-under-cygwin.patch | 391 ++++++++++++++++++
 1 file changed, 391 insertions(+)
 create mode 100644 package/c-icap/0001-Required-f
ixes-to-compile-and-run-under-cygwin.patch

diff --git a/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch
b/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch
new file mode 100644
index 0000000000..6f886c9b72
--- /dev/null
+++ b/package/c-icap/0001-Required-fixes-to-compile-and-run-
under-cygwin.patch
@@ -0,0 +1,391 @@
+From 1631a6c1f50e152b8a45d8279c96086e5636795b Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Fri, 25 Jan 2019 06:42:22 -0800
+Subject: [PATCH] Required fixes to compile and run under cygwin
+
+[Retrieved (and backported) from:
+https://github.com/c-icap/c-icap-server/commit/1631a6c1f50e
152b8a45d8279c96086e5636795b,
+which has the side effect of fixing the build with the musl C library]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am                 |  2 +-
+ configure.ac                | 10 +++++++---
+ header.c                    | 34 ----------------------------------
+ include/header.h            |  8 --------
+ modules/Makefile.am         | 34 ++++++++++++++++++++--------------
+ modules/bdb_tables.c        | 17 +++++++++++++++--
+ modules/shared_cache.c      | 12 ++++++++++++
+ modules/sys_logger.c        | 13 +++++++++++++
+ services/echo/Makefile.am   | 10 ++++++++--
+ services/ex-206/Makefile.am | 10 ++++++++--
+ utils/c-icap-mkbdb.c        |  8 ++++----
+ 11 files changed, 88 insertions(+), 70 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4c34033..ab80f4f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -53,7 +53,7 @@ c_icap_SOURCES = aserver.c request.c cfg_param.c \
+ libicapapi_la_CFLAGS= $(INVISIBILITY_CFLAG) -I$(srcdir)/include/
-Iinclude/ @ZLIB_ADD_FLAG@ @OPENSSL_ADD_FLAG@ @BZLIB_ADD_FLAG@
@BROTLI_ADD_FLAG@ @PCRE_ADD_FLAG@ -DCI_BUILD_LIB
+
+ libicapapi_la_LIBADD = @ZLIB_ADD_LDADD@ @BZLIB_ADD_LDADD@
@BROTLI_ADD_LDADD@ @PCRE_ADD_LDADD@ @DL_ADD_FLAG@ @THREADS_LDADD@
@OPENSSL_ADD_LDADD@
+-libicapapi_la_LDFLAGS= -shared -version-info @CICAPLIB_VERSION@
@THREADS_LDFLAGS@
++libicapapi_la_LDFLAGS= -shared -version-info @CICAPLIB_VERSION@
@LIBS_LDFLAGS@ @THREADS_LDFLAGS@
+
+ export EXT_PROGRAMS_MKLIB = @ZLIB_LNDIR_LDADD@ @BZLIB_LNDIR_LDADD@
@BROTLI_LNDIR_LDADD@ @PCRE_LNDIR_LDADD@ @OPENSSL_LNDIR_LDADD@
+
+diff --git a/configure.ac b/configure.ac
+index 405571b..8059cb7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,12 +45,14 @@ case "$host_os" in
+       CFLAGS="-D_REENTRANT $CFLAGS"
+       THREADS_LDADD="-lpthread"
+       THREADS_LDFLAGS=""
++      LIBS_LDFLAGS=""
+      ;;
+      solaris2.*)
+         CFLAGS="-D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS $CFLAGS"
+           LIBS="-lsocket -lnsl -lrt $LIBS"
+         THREADS_LDADD="-lpthread"
+         THREADS_LDFLAGS=""
++        LIBS_LDFLAGS=""
+       ;;
+       freebsd5*)
+ ## If I understand how all those threading models works correctly
+@@ -69,6 +71,7 @@ case "$host_os" in
+               CFLAGS="-pthread -D_THREAD_SAFE  $CFLAGS"
+       THREADS_LDADD="-XCClinker -lc_r"
+       THREADS_LDFLAGS=""
++      LIBS_LDFLAGS=""
+ ## FreeBSD has pthreads rwlocks from version 3 (I think)
+ #     AC_DEFINE(HAVE_PTHREADS_RWLOCK,1,[Define HAVE_PTHREADS_RWLOCK if
pthreads library supports rwlocks])
+ ##   1:1 threads
+@@ -82,24 +85,28 @@ case "$host_os" in
+         CFLAGS="-D_THREAD_SAFE  $CFLAGS"
+         THREADS_LDADD="-XCClinker -lthr"
+         THREADS_LDFLAGS=""
++      LIBS_LDFLAGS=""
+       ;;
+
+       cygwin*)
+       CFLAGS="-D_REENTRANT $CFLAGS"
+       THREADS_LDADD="-lpthread"
+       THREADS_LDFLAGS="";
++      LIBS_LDFLAGS="-no-undefined"
+       iscygwin="yes"
+       ;;
+       *)
+               CFLAGS="-D_REENTRANT $CFLAGS"
+       THREADS_LDADD="-lpthread"
+       THREADS_LDFLAGS=""
++      LIBS_LDFLAGS=""
+       ;;
+ esac
+
+ TEST_LIBS="$TEST_LIBS $THREADS_LDADD"
+ AC_SUBST(THREADS_LDADD)
+ AC_SUBST(THREADS_LDFLAGS)
++AC_SUBST(LIBS_LDFLAGS)
+
+ AC_DEFINE_UNQUOTED(C_ICAP_CONFIGURE_OPTIONS, "$ac_configure_args",
+                    [configure command line used to configure c-icap])
+@@ -984,9 +991,6 @@ LIBS="$LIBS $EXTRALIBS"
+
+ #Configure common flags
+ MODULES_LIBADD=""
+-if test a"$iscygwin" != a; then
+-     MODULES_LIBADD="-L../../ -licapapi"
+-fi
+ MODULES_CFLAGS="$INVISIBILITY_CFLAG -DCI_BUILD_MODULE"
+ AC_SUBST(MODULES_LIBADD)
+ AC_SUBST(MODULES_CFLAGS)
+diff --git a/header.c b/header.c
+index 807a2e0..266b958 100644
+--- a/header.c
++++ b/header.c
+@@ -110,21 +110,6 @@ const struct ci_error_code ci_error_codes[] = {
+     {505, "Unsupported version"}       /*ICAP version not supported by
server. */
+ };
+
+-/*
+-#ifdef __CYGWIN__
+-int ci_error_code(int ec){
+-     return (ec >= EC_100 && ec < EC_MAX ? ci_error_codes[ec].code:1000);
+-}
+-
+-const char *unknownerrorcode = "UNKNOWN ERROR CODE";
+-
+-const char *ci_error_code_string(int ec){
+-     return (ec >= EC_100 && ec < EC_MAX?ci_error_codes[ec].str:
unknownerrorcode);
+-}
+-#endif
+-*/
+-
+-
+ const char *ci_encaps_entities[] = {
+     "req-hdr",
+     "res-hdr",
+@@ -134,25 +119,6 @@ const char *ci_encaps_entities[] = {
+     "opt-body"
+ };
+
+-#ifdef __CYGWIN__
+-
+-const char *unknownentity = "UNKNOWN";
+-const char *unknownmethod = "UNKNOWN";
+-
+-const char *ci_method_string(int method)
+-{
+-    return (method <= ICAP_RESPMOD
+-            && method >= ICAP_OPTIONS ? CI_Methods[method] :
unknownmethod);
+-}
+-
+-
+-const char *ci_encaps_entity_string(int e)
+-{
+-    return (e <= ICAP_OPT_BODY
+-            && e >= ICAP_REQ_HDR ? CI_EncapsEntities[e] : unknownentity);
+-}
+-#endif
+-
+ ci_headers_list_t *ci_headers_create()
+ {
+     ci_headers_list_t *h;
+diff --git a/include/header.h b/include/header.h
+index 4cab365..ed2de88 100644
+--- a/include/header.h
++++ b/include/header.h
+@@ -52,16 +52,8 @@ enum ci_encapsulated_entities {ICAP_REQ_HDR,
ICAP_RES_HDR,
+                               };
+ CI_DECLARE_DATA extern const char *ci_encaps_entities[];
+
+-#ifdef __CYGWIN__
+-
+-const char *ci_encaps_entity_string(int e);
+-
+-#else
+-
+ #define ci_encaps_entity_string(e) (e <= ICAP_OPT_BODY && e >=
ICAP_REQ_HDR?ci_encaps_entities[e]:"UNKNOWN")
+
+-#endif
+-
+ /**
+  \typedef ci_headers_list_t
+  \ingroup HEADERS
+diff --git a/modules/Makefile.am b/modules/Makefile.am
+index e6e9270..2d43a60 100644
+--- a/modules/Makefile.am
++++ b/modules/Makefile.am
+@@ -21,38 +21,44 @@ endif
+
+ AM_CPPFLAGS=-I$(top_srcdir)/ -I$(top_srcdir)/include/
-I$(top_builddir)/include/
+
+-sys_logger_la_LIBADD = @MODULES_LIBADD@
++if ISCYGWIN
++MODS_LIB_ADD=$(top_builddir)/libicapapi.la
++else
++MODS_LIB_ADD=
++endif
++
++sys_logger_la_LIBADD = $(MODS_LIB_ADD)
+ sys_logger_la_CFLAGS=  @MODULES_CFLAGS@ @OPENSSL_ADD_FLAG@
+-sys_logger_la_LDFLAGS= -module -avoid-version
++sys_logger_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ sys_logger_la_SOURCES = sys_logger.c
+
+-dnsbl_tables_la_LIBADD = @MODULES_LIBADD@
++dnsbl_tables_la_LIBADD = $(MODS_LIB_ADD)
+ dnsbl_tables_la_CFLAGS=  @MODULES_CFLAGS@ @OPENSSL_ADD_FLAG@
+-dnsbl_tables_la_LDFLAGS= -module -avoid-version
++dnsbl_tables_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ dnsbl_tables_la_SOURCES = dnsbl_tables.c
+
+-perl_handler_la_LIBADD = @MODULES_LIBADD@ @perllib@  -L at perlcore@ -lperl
++perl_handler_la_LIBADD = $(MODS_LIB_ADD) @perllib@  -L at perlcore@ -lperl
+ perl_handler_la_CFLAGS=  @MODULES_CFLAGS@ @perlccflags@ -I at perlcore@
+-perl_handler_la_LDFLAGS= -module -avoid-version @perlldflags@
++perl_handler_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
@perlldflags@
+ perl_handler_la_SOURCES = perl_handler.c
+
+
+-bdb_tables_la_LIBADD = @MODULES_LIBADD@ @BDB_ADD_LDADD@
++bdb_tables_la_LIBADD = $(MODS_LIB_ADD) @BDB_ADD_LDADD@
+ bdb_tables_la_CFLAGS=  @MODULES_CFLAGS@ @BDB_ADD_FLAG@
+-bdb_tables_la_LDFLAGS= -module -avoid-version
++bdb_tables_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ bdb_tables_la_SOURCES = bdb_tables.c
+
+-ldap_module_la_LIBADD = @MODULES_LIBADD@ @LDAP_ADD_LDADD@ $(top_builddir)/
libicapapi.la
++ldap_module_la_LIBADD = $(MODS_LIB_ADD) @LDAP_ADD_LDADD@
+ ldap_module_la_CFLAGS=  @MODULES_CFLAGS@ @LDAP_ADD_FLAG@
+-ldap_module_la_LDFLAGS= -module -avoid-version
++ldap_module_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ ldap_module_la_SOURCES = ldap_module.c
+
+-memcached_cache_la_LIBADD=  @MODULES_LIBADD@ @MEMCACHED_ADD_LDADD@
++memcached_cache_la_LIBADD=  $(MODS_LIB_ADD) @MEMCACHED_ADD_LDADD@
+ memcached_cache_la_CFLAGS=  @MODULES_CFLAGS@ @MEMCACHED_ADD_FLAG@
+-memcached_cache_la_LDFLAGS= -module -avoid-version
++memcached_cache_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ memcached_cache_la_SOURCES= memcached.c
+
+-shared_cache_la_LIBADD= @MODULES_LIBADD@
++shared_cache_la_LIBADD= $(MODS_LIB_ADD)
+ shared_cache_la_CFLAGS= @OPENSSL_ADD_FLAG@
+-shared_cache_la_LDFLAGS= -module -avoid-version
++shared_cache_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ shared_cache_la_SOURCES= shared_cache.c
+diff --git a/modules/bdb_tables.c b/modules/bdb_tables.c
+index b8459be..1e908a9 100644
+--- a/modules/bdb_tables.c
++++ b/modules/bdb_tables.c
+@@ -176,8 +176,8 @@ void *bdb_table_open(struct ci_lookup_table *table)
+
+     /*We can not fork a Berkeley DB table, so we have to
+       open bdb tables for every child, on childs start-up procedure*/
+-    register_command_extend("openBDBtable", CHILD_START_CMD, table,
+-                            command_real_open_table);
++    ci_command_register_action("openBDBtable", CHILD_START_CMD, table,
++                             command_real_open_table);
+
+     return table->data;
+ }
+@@ -257,3 +257,16 @@ void  bdb_table_release_result(struct ci_lookup_table
*table,void **val)
+ {
+     ci_buffer_free(val);
+ }
++
++ #ifdef __CYGWIN__
++#include <w32api/windows.h>
++void ci_command_register_action(const char *name, int type, void *data,
++                              void (*command_action) (const char *name,
int type, void *data))
++ {
++   typedef void (*RA)(const char *, int, void *, void(*)(const char *,
int, void *));
++   RA fn;
++   fn = (RA)GetProcAddress(GetModuleHandle(NULL),
"ci_command_register_action");
++   if (fn)
++     (*fn)(name, type, data, command_action);
++ }
++#endif
+diff --git a/modules/shared_cache.c b/modules/shared_cache.c
+index 103b760..a79d51a 100644
+--- a/modules/shared_cache.c
++++ b/modules/shared_cache.c
+@@ -345,3 +345,15 @@ void ci_shared_cache_destroy(struct ci_cache *cache)
+         ci_shared_mem_detach(&data->id);
+ }
+
++#ifdef __CYGWIN__
++#include <w32api/windows.h>
++void ci_command_register_action(const char *name, int type, void *data,
++                              void (*command_action) (const char *name,
int type, void *data))
++ {
++   typedef void (*RA)(const char *, int, void *, void(*)(const char *,
int, void *));
++   RA fn;
++   fn = (RA)GetProcAddress(GetModuleHandle(NULL),
"ci_command_register_action");
++   if (fn)
++     (*fn)(name, type, data, command_action);
++ }
++#endif
+diff --git a/modules/sys_logger.c b/modules/sys_logger.c
+index 1c47753..1764b0d 100644
+--- a/modules/sys_logger.c
++++ b/modules/sys_logger.c
+@@ -60,7 +60,20 @@ int cfg_syslog_access(const char *directive, const char
**argv, void *setdata);
+    functions declared in log.c. This file is not included in c-icap
library
+    but defined in primary c-icap binary.
+ */
++#ifdef __CYGWIN__
++#include <w32api/windows.h>
++char *logformat_fmt(const char *name)
++{
++  typedef char* (*LF_FMT)(const char *);
++  LF_FMT fn;
++  fn = (LF_FMT)GetProcAddress(GetModuleHandle(NULL), "logformat_fmt");
++  if (fn)
++    return (*fn)(name);
++  return NULL;
++}
++#else
+ extern char *logformat_fmt(const char *name);
++#endif
+
+ /*Configuration Table .....*/
+ static struct ci_conf_entry conf_variables[] = {
+diff --git a/services/echo/Makefile.am b/services/echo/Makefile.am
+index 402c8f9..7d701b1 100644
+--- a/services/echo/Makefile.am
++++ b/services/echo/Makefile.am
+@@ -3,9 +3,15 @@ pkglib_LTLIBRARIES=srv_echo.la
+
+ AM_CPPFLAGS=-I$(top_srcdir)/ -I$(top_srcdir)/include/
-I$(top_builddir)/include/
+
+-srv_echo_la_LIBADD = @MODULES_LIBADD@
++if ISCYGWIN
++MODS_LIB_ADD=$(top_builddir)/libicapapi.la
++else
++MODS_LIB_ADD=
++endif
++
++srv_echo_la_LIBADD = $(MODS_LIB_ADD)
+ srv_echo_la_CFLAGS=  @MODULES_CFLAGS@ @OPENSSL_ADD_FLAG@
+-srv_echo_la_LDFLAGS= -module -avoid-version
++srv_echo_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ srv_echo_la_SOURCES = srv_echo.c
+
+
+diff --git a/services/ex-206/Makefile.am b/services/ex-206/Makefile.am
+index 44bbf21..ff73399 100644
+--- a/services/ex-206/Makefile.am
++++ b/services/ex-206/Makefile.am
+@@ -3,8 +3,14 @@ pkglib_LTLIBRARIES=srv_ex206.la
+
+ AM_CPPFLAGS=-I$(top_srcdir)/ -I$(top_srcdir)/include/
-I$(top_builddir)/include/
+
+-srv_ex206_la_LIBADD = @MODULES_LIBADD@
++if ISCYGWIN
++MODS_LIB_ADD=$(top_builddir)/libicapapi.la
++else
++MODS_LIB_ADD=
++endif
++
++srv_ex206_la_LIBADD = $(MODS_LIB_ADD)
+ srv_ex206_la_CFLAGS=  @MODULES_CFLAGS@ @OPENSSL_ADD_FLAG@
+-srv_ex206_la_LDFLAGS= -module -avoid-version
++srv_ex206_la_LDFLAGS= -module -avoid-version @LIBS_LDFLAGS@
+ srv_ex206_la_SOURCES = srv_ex206.c
+
+diff --git a/utils/c-icap-mkbdb.c b/utils/c-icap-mkbdb.c
+index c29a46f..326ee1c 100644
+--- a/utils/c-icap-mkbdb.c
++++ b/utils/c-icap-mkbdb.c
+@@ -23,7 +23,7 @@ char *dbfile = NULL;
+ int DUMP_MODE = 0;
+ int VERSION_MODE = 0;
+ int USE_DBTREE = 0;
+-long int PAGE_SIZE;
++long int DB_PAGE_SIZE;
+
+ ci_mem_allocator_t *allocator = NULL;
+ int cfg_set_type(const char *directive, const char **argv, void *setdata);
+@@ -52,7 +52,7 @@ static struct ci_options_entry options[] = {
+         "The type of values"
+     },
+     {
+-        "-p", "page_size", &PAGE_SIZE, ci_cfg_size_long,
++        "-p", "page_size", &DB_PAGE_SIZE, ci_cfg_size_long,
+         "The page size to use for the database"
+     },
+     {
+@@ -107,8 +107,8 @@ int open_db(char *path)
+         return 0;
+     }
+
+-    if (PAGE_SIZE > 512 && PAGE_SIZE <= 64*1024)
+-        db->set_pagesize(db, (uint32_t)PAGE_SIZE);
++    if (DB_PAGE_SIZE > 512 && DB_PAGE_SIZE <= 64*1024)
++        db->set_pagesize(db, (uint32_t)DB_PAGE_SIZE);
+
+     if ((ret = db->open(db, NULL, path, NULL,
+                         (USE_DBTREE ? DB_BTREE : DB_HASH),
-- 
2.26.2



------------------------------

Message: 22
Date: Fri, 08 May 2020 09:10:41 +0000
From: bugzilla@busybox.net
To: buildroot at uclibc.org
Subject: [Buildroot] [Bug 12841] util-linux/sfdisk 2.35.1 fails on
        sector-size header
Message-ID: <bug-12841-163-UUAiJL3FjH@https.bugs.busybox.net/>
Content-Type: text/plain; charset="UTF-8"

https://bugs.busybox.net/show_bug.cgi?id=12841

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
Hi,

Instead of adding a custom patch, I retrieved the upstream patch:
https://patchwork.ozlabs.org/project/buildroot/patch/2020050
7224150.242211-2-fontaine.fabrice at gmail.com

Can you confirm that the patch above fixes your issue?

Best Regards,

Fabrice

-- 
You are receiving this mail because:
You are on the CC list for the bug.

------------------------------

Message: 23
Date: Fri, 08 May 2020 11:34:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot at buildroot.org,  Danomi Manchego
        <danomimanchego123@gmail.com>
Subject: Re: [Buildroot] [PATCH] release: don't include temp files
Message-ID: <87eerusrca.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we prepare the release, we generate the manual in various formats,
 > so that it can be consulted locally without needing the miriads of tools
 > needed to generate it.

 > However, this creates the temporary .br2-external.* files in the output
 > directory, and those end up in the release tarball.

 > This is not a problem in practice, but is not clean.

 > Run 'distclean' in the output directory, to get rid of everything but
 > the generated documentation.

 > Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

I am a bit surprised that our 'make distclean' doesn't delete the
generated documentation, but OK - Here it is handy.

Committed, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 24
Date: Fri, 8 May 2020 11:33:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit] release: don't include temp files
Message-ID: <20200508091917.38AF691046@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bee47598aa1f8
53df14f7edb51d8a7cadcfa9939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we prepare the release, we generate the manual in various formats,
so that it can be consulted locally without needing the miriads of tools
needed to generate it.

However, this creates the temporary .br2-external.* files in the output
directory, and those end up in the release tarball.

This is not a problem in practice, but is not clean.

Run 'distclean' in the output directory, to get rid of everything but
the generated documentation.

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3aa4ba4532..2da34b5305 100644
--- a/Makefile
+++ b/Makefile
@@ -1190,7 +1190,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 release:
        git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
        $(MAKE) O=$(OUT) manual-html manual-text manual-pdf
-       $(MAKE) O=$(OUT) clean
+       $(MAKE) O=$(OUT) distclean
        tar rf $(OUT).tar $(OUT)
        gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
        bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2


------------------------------

Message: 25
Date: Fri, 08 May 2020 11:38:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: buildroot at buildroot.org,  Thomas Petazzoni
        <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/binutils: fix xtensa PR
        ld/25861
Message-ID: <87a72isr55.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Handle link-time relaxation of full 16-bit difference values correctly
 > in xtensa linker. This fixes the following kind of build errors:

 > .../five-point.cpp:338:(.debug_line+0x3b12):
 >              dangerous relocation: overflow after relaxation

 > Backported from:
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=
commitdiff;h=30ce8e47fad9b057b6d7af9e1d43061126d34d20
 > Fixes:
 > http://autobuild.buildroot.net/results/67a5545779bbe8ca2b21d
a1f3ff2002053710ce1/
 > http://autobuild.buildroot.net/results/87f38998d2d60b6bce312
8589973187ef9596e28/

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 26
Date: Fri, 08 May 2020 11:38:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: buildroot at buildroot.org, Romain Naour <romain.naour@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/binutils: fix XTENSA_NDIFF
        handling for PR ld/25861
Message-ID: <875zd6sr4p.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Fix for xtensa PR ld/25861 introduced a regression in handling negative
 > symbol differences resulting in linker performing incorrect relaxation
 > or failing to link. Fix XTENSA_NDIFF relocation handling.

 > Backported from:
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=
commitdiff;h=d548f47df4d2e3d117d504a4c9977982c78a0556

 > Fixes: f0291ef4aba0 ("package/binutils: fix xtensa PR ld/25861")
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 27
Date: Fri, 08 May 2020 11:39:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/evtest: switch to Gitlab
Message-ID: <871rnusr3a.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=utf-8

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com>
writes:

 > Downloading from the cgit repo is now broken and it is a mirror of the
 > Gitlab repo so use the Gitlab repo.

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 28
Date: Fri,  8 May 2020 11:45:09 +0200
From: Joachim Nilsson <troglobit@gmail.com>
To: buildroot at buildroot.org
Cc: Joachim Nilsson <troglobit@gmail.com>
Subject: [Buildroot] [PATCH 1/1] configs/globalscale_espressobin: new
        defconfig
Message-ID: <20200508094509.2574240-1-troglobit@gmail.com>

Basic support for the Marvell ESPRESSObin, by Globalscale Technologies.

  http://espressobin.net

The kernel config has been extended with a fragment to enable switchcore
support, DSA drivers, and VLAN filtering in the bridge.  To make use of
this you need a custom libnl based application, or the iproute2 suite
rather than the brctl tools, which don't support the VLAN filtering.

Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
---
 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  4 +
 board/globalscale/espressobin/genimage.cfg    | 11 +++
 .../espressobin/linux-extras.config           | 14 +++
 board/globalscale/espressobin/readme.txt      | 90 +++++++++++++++++++
 configs/globalscale_espressobin_defconfig     | 26 ++++++
 6 files changed, 146 insertions(+)
 create mode 100644 board/globalscale/espressobin/genimage.cfg
 create mode 100644 board/globalscale/espressobin/linux-extras.config
 create mode 100644 board/globalscale/espressobin/readme.txt
 create mode 100644 configs/globalscale_espressobin_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..071d76974a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -197,6 +197,7 @@ friendlyarm_nanopi_a64_defconfig: { extends: .defconfig
}
 friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo_plus2_defconfig: { extends: .defconfig }
 galileo_defconfig: { extends: .defconfig }
+globalscale_espressobin_defconfig: { extends: .defconfig }
 grinn_chiliboard_defconfig: { extends: .defconfig }
 grinn_liteboard_defconfig: { extends: .defconfig }
 hifive_unleashed_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..e926174797 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,10 @@ F:       package/libuhttpd/
 F:     package/libuwsc/
 F:     package/rtty/

+N:     Joachim Nilsson <troglobit@gmail.com>
+F:     configs/globalscale_espressobin_defconfig
+F:     board/globalscale/espressobin/
+
 N:     Joao Pinto <jpinto@synopsys.com>
 F:     board/synopsys/vdk/
 F:     configs/snps_aarch64_vdk_defconfig
diff --git a/board/globalscale/espressobin/genimage.cfg
b/board/globalscale/espressobin/genimage.cfg
new file mode 100644
index 0000000000..360c8f098f
--- /dev/null
+++ b/board/globalscale/espressobin/genimage.cfg
@@ -0,0 +1,11 @@
+# Minimal image, no U-boot since v3/v5 cannot boot from sdcard, see
+# readme.txt for details on configuring the on-board u-boot.
+image sdcard.img {
+       hdimage {
+       }
+
+       partition rootfs {
+               partition-type = 0x83
+               image = "rootfs.ext4"
+       }
+}
diff --git a/board/globalscale/espressobin/linux-extras.config
b/board/globalscale/espressobin/linux-extras.config
new file mode 100644
index 0000000000..7ce0a495c1
--- /dev/null
+++ b/board/globalscale/espressobin/linux-extras.config
@@ -0,0 +1,14 @@
+#
+# The Espressobin has a switchcore with full support in the kernel.
+# This fragment enables DSA and its drivers, inclding VLAN aware bridge
+# support to allow users to easily set up a LAN switch + WAN interface.
+#
+CONFIG_NET_DSA=m
+CONFIG_VLAN_8021Q=y
+
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_IGMP_SNOOPING=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+
+CONFIG_NET_DSA_MV88E6XXX=m
+CONFIG_NET_DSA_MV88E6XXX_PTP=y
diff --git a/board/globalscale/espressobin/readme.txt
b/board/globalscale/espressobin/readme.txt
new file mode 100644
index 0000000000..e519b1e1f4
--- /dev/null
+++ b/board/globalscale/espressobin/readme.txt
@@ -0,0 +1,90 @@
+Marvell ESPRESSObin
+===================
+
+This default configuration allows you to quickly get up and running with
+the Marvell ESPRESSObin board by Globalscale Technologies Inc.
+
+The ESPRESSObin is based on the Marvell Armada 88F3720 SoC, coupled with
+a Marvell 88E6341 switch core "Topaz", with three exposed gigabit ports.
+
+     _________________________
+    |#  U     W   L  L    U  #|
+    |#  S     A   A  A    S  #|
+    |#  B     N   N  N    B  #|
+    |#            0  1       #|
+    |#      Mini             #|
+    |#      -PCI             #|
+    |#                       #|
+    |#  5                    #|
+    |#__V___usb_PWR_SATA__SW_#|
+
+    Fig 1: Overview of board
+
+Notice difference in Ethernet port layout compared to the Globalscale
+docs.  They order the ports; LAN2, LAN1, WAN (left to right in figure
+above).  For more information, see http://espressobin.net
+
+
+Building
+--------
+
+    $ make globalscale_espressobin_defconfig
+    $ make
+
+This generates the kernel image, the devicetree binary, the rootfs as a
+tar.gz, and a filesystem image containing everything.
+
+All build artifacts are located in `output/images/`
+
+
+Booting
+-------
+
+To boot, you need a UART connection, using the on-board micro USB port
+set to 115200 8N1.
+
+By default, the ESPRESSObin comes with a pre-flashed U-Boot set up to
+load the kernel, device-tree and rootfs from SPI NOR flash.  The board
+jumpers can be changed to boot from different sources, see the quick
+start guide for each board revision for details:
+
+- ftp://downloads.globalscaletechnologies.com/Downloads/
Espressobin/ESPRESSObin%20V5/
+- ftp://downloads.globalscaletechnologies.com/Downloads/
Espressobin/ESPRESSObin%20V7/
+
+Note: the v5, and earlier, cannot boot from sdcard, so you have to set
+up the factory U-Boot to boot into Buildroot:
+
+1. Flash rootfs image to sdcard drive, your `of=` device may differ:
+
+        $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=1M
+        $ sync
+
+2. Boot board from SPI NOR, interrupt boot by pressing any key ...
+3. Check with `printenv` that the default setup is OK, otherwise ensure
+   the following are set, and define `bootcmd` for automatic boot:
+
+       > setenv kernel_addr 0x5000000
+        > setenv fdt_addr 0x1800000
+        > setenv fdt_name boot/armada-3720-espressobin.dtb
+       > setenv console console=ttyMV0,115200
earlycon=ar3700_uart,0xd0012000
+        > setenv bootcmd 'mmc dev 0; ext4load mmc 0:1 $kernel_addr
$image_name;ext4load mmc 0:1 $fdt_addr $fdt_name;setenv bootargs $console
root=/dev/mmcblk0p1 rw rootwait; booti $kernel_addr - $fdt_addr'
+
+4. Call the boot command, or `reset` the board to start:
+
+        > run bootcmd
+
+
+Networking
+----------
+
+To enable Ethernet networking, load the `mv88e6xxx` kernel module, and
+bring up each respective interface needed:
+
+    # modprobe mv88e6xxx
+    # ifconfig wan up
+
+A more advanced scenario is setting up switching between the ports using
+the Linux bridge.  The kernel switchdev layer, and DSA driver, ensure
+switch functions are "offloaded" to the HW switch, i.e., all traffic
+between LAN ports never reach the CPU.  For this you need the iproute2
+suite of tools.
diff --git a/configs/globalscale_espressobin_defconfig
b/configs/globalscale_espressobin_defconfig
new file mode 100644
index 0000000000..c0b9f69559
--- /dev/null
+++ b/configs/globalscale_espressobin_defconfig
@@ -0,0 +1,26 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.11"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/
espressobin/linux-extras.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin
marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7
marvell/armada-3720-espressobin-v7-emmc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
-- 
2.25.1



------------------------------

Message: 29
Date: Fri, 08 May 2020 11:49:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH] package/apache: fixing apxs path
        mangling
Message-ID: <87wo5mrc30.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Latest version of Apache introduce a new apxs with a slightly modified
 > path handling logic. In order to simplify the crosscompilation, the
 > software removes the common prefix from bin install dir and build
 > install dir, but for this to work they both should have a common
 > prefix. So we introduce a new regexp to fix /usr/bin to staging dir,
 > the regexps are also fixed to replace only the exact path between
 > double quotes.a

 > Fixes:
 > http://autobuild.buildroot.net/results/c41f31566974209897a3a
1ec35afe2536fb248cc
 > http://autobuild.buildroot.net/results/b93f19976ce96e79ea159
c25ed74a7377c78f334

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 30
Date: Fri, 08 May 2020 11:51:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [git commit] package/wireguard-linux-compat:
        depend on headers < 5.6
Message-ID: <87sggarbzm.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=da5afc10a45d1
e1b5ab7ab6f9230ed7ba44581e7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since wireguard is built into kernels 5.6 and later we can't build
 > wireguard-linux-compat on them, so we need to depend on
 > !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 31
Date: Fri, 08 May 2020 11:51:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: Re: [Buildroot] [git commit] package/wireguard-linux-compat:
        tweak kernel-headers < 5.6 logic
Message-ID: <87o8qyrbyp.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=74a865b1fc853
52b814d032fa8725ace13f27eca
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The reason why the external wireguard kernel module is not allowed with
 > kernel headers >= 5.6 is that wireguard is included in the upstream
kernel
 > since 5.6 rather than some kind of (fixable) incompatibility issue.
Adjust
 > the comment to make that clear.

 > While we're at it, drop the redundant !5.6 dependency on the kernel
headers
 > dependency comment.  If headers are older than 3.10, then they are also
 > older than 5.6, so the statement is redundant.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 32
Date: Fri, 08 May 2020 11:52:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Timo Ketola <Timo.Ketola@exertus.fi>, "buildroot\@buildroot.org"
        <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init
        script survive 'console=' kernel argument
Message-ID: <87k11mrbwo.fsf@dell.be.48ers.dk>
Content-Type: text/plain

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Timo, All,
 > On 2019-09-23 10:58 +0000, Timo Ketola spake thusly:
 >> When booting with 'console=<empty>' in the kernel command line (as e.g.
 >> U-Boot does with silent flags in effect), opening /dev/console fails.
 >> That is fatal in the /init script and kernel will panic. It is also
 >> needless, because the kernel tries to open it anyway (well, as long as
 >> we have console node in initramfs /dev; cpio.mk creates that alright).
 >>
 >> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

 > I've applied to master, after extending the commit log with all the gory
 > details explaininng why we can indeed safely remove those redisrections
 > now.

 > Thank you for the patience on this patch.

 > Thanks also to Peter for helping on IRC about this research.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard


------------------------------

Message: 33
Date: Fri, 8 May 2020 11:50:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x]
        package/wireguard-linux-compat: tweak kernel-headers < 5.6 logic
Message-ID: <20200508093729.D38B491054@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b3ca0be160ae
5a2b1ee5da26772f02d7f130f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The reason why the external wireguard kernel module is not allowed with
kernel headers >= 5.6 is that wireguard is included in the upstream kernel
since 5.6 rather than some kind of (fixable) incompatibility issue.  Adjust
the comment to make that clear.

While we're at it, drop the redundant !5.6 dependency on the kernel headers
dependency comment.  If headers are older than 3.10, then they are also
older than 5.6, so the statement is redundant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74a865b1fc85352b814d032fa8725ace13f27eca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireguard-linux-compat/Config.in
b/package/wireguard-linux-compat/Config.in
index 6e41a0951b..5a323a35e5 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
        depends on BR2_LINUX_KERNEL
        # kernel module requires 3.10+
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-       # kernel module incompatible with 5.6+
+       # kernel module in upstream linux since 5.6
        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
        help
          WireGuard is an extremely simple yet fast and modern VPN
@@ -23,5 +23,4 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT

 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
        depends on BR2_LINUX_KERNEL
-       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10


------------------------------

Message: 34
Date: Fri, 8 May 2020 11:41:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/apache:
        fixing apxs path mangling
Message-ID: <20200508093729.B977391052@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9580c835b9cb
36ef3264ebee82fca2c6fe4ce60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Latest version of Apache introduce a new apxs with a slightly modified
path handling logic. In order to simplify the crosscompilation, the
software removes the common prefix from bin install dir and build
install dir, but for this to work they both should have a common prefix.

So we introduce a new regexp to fix /usr/bin to staging dir, the regexps
are also fixed to replace only the exact path between double quotes, to
avoid replacing the she-bang line.

Fixes:
http://autobuild.buildroot.net/results/c41f31566974209897a3a
1ec35afe2536fb248cc
http://autobuild.buildroot.net/results/b93f19976ce96e79ea159
c25ed74a7377c78f334

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - add the last few words about the she-bang blurb
  - do not use quotes in the existing /sur/bin regexp
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa04edab77c75bc04ffb52755430bcdeb19c6d74)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 48a64eae0e..068f36e325 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -99,6 +99,7 @@ APACHE_CONF_OPTS += --disable-deflate
 endif

 define APACHE_FIX_STAGING_APACHE_CONFIG
+       $(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%'
$(STAGING_DIR)/usr/bin/apxs
        $(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%'
$(STAGING_DIR)/usr/bin/apxs
        $(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%'
$(STAGING_DIR)/usr/build/config_vars.mk
 endef


------------------------------

Message: 35
Date: Fri, 8 May 2020 11:50:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x]
        package/wireguard-linux-compat: depend on headers < 5.6
Message-ID: <20200508093729.C96C391052@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50f63e0271720
70358a1af5ec08a1b9d880ac767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since wireguard is built into kernels 5.6 and later we can't build
wireguard-linux-compat on them, so we need to depend on
!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da5afc10a45d1e1b5ab7ab6f9230ed7ba44581e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/wireguard-linux-compat/Config.in
b/package/wireguard-linux-compat/Config.in
index 4ee214be63..6e41a0951b 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
        depends on BR2_LINUX_KERNEL
        # kernel module requires 3.10+
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+       # kernel module incompatible with 5.6+
+       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
        help
          WireGuard is an extremely simple yet fast and modern VPN
          that utilizes state-of-the-art cryptography. It aims to be
@@ -20,4 +22,6 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
          https://www.wireguard.com

 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
-       depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+       depends on BR2_LINUX_KERNEL
+       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10


------------------------------

Message: 36
Date: Fri, 8 May 2020 11:37:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot at buildroot.org
Subject: [Buildroot] [git commit branch/2020.02.x] package/binutils:
        fix XTENSA_NDIFF handling for PR ld/25861
Message-ID: <20200508093729.9AE7B90FE2@busybox.osuosl.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05e9d76c12716
28abd138227f9063c5942e720ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix for xtensa PR ld/25861 introduced a regression in handling negative
symbol differences resulting in linker performing incorrect relaxation
or failing to link. Fix XTENSA_NDIFF relocation handling.

Backported from:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=
commitdiff;h=d548f47df4d2e3d117d504a4c9977982c78a0556

Fixes: f0291ef4aba0 ("package/binutils: fix xtensa PR ld/25861")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f31db17a8d3accc7367e262c326f467f7dc879a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128
+++++++++++++++++++++
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128
+++++++++++++++++++++
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128
+++++++++++++++++++++
 3 files changed, 384 insertions(+)

diff --git a/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
b/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handl
ing-for-PR-ld-25861.patch
new file mode 100644
index 0000000000..28f17d7c56
--- /dev/null
+++ b/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handl
ing-for-PR-ld-25861.patch
@@ -0,0 +1,128 @@
+From 735321812435ae278d3766a3371f55937dc776d6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Apr 2020 00:40:25 -0700
+Subject: [PATCH] xtensa: fix XTENSA_NDIFF handling for PR ld/25861
+
+Fields marked with XTENSA_NDIFF relocations are not negated, they only
+have sign bits removed. Don't negate their values when relaxation is
+performed. Don't add sign bits when the value is zero. Report overflow
+when the result has negative sign but all significant bits are zero.
+
+2020-04-29  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+       * elf32-xtensa.c (relax_section): Don't negate diff_value for
+       XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
+       equals 0. Report overflow when the result has negative sign but
+       all significant bits are zero.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: d548f47df4d2e3d117d504a4c9977982c78a0556
+---
+
+ bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index fded42d52a9a..4327b027911f 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct
bfd_link_info *link_info)
+                 switch (r_type)
+                   {
+                   case R_XTENSA_DIFF8:
++                    diff_mask = 0x7f;
+                     diff_value =
+                       bfd_get_signed_8 (abfd,
&contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF16:
++                    diff_mask = 0x7fff;
+                     diff_value =
+                       bfd_get_signed_16 (abfd,
&contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF32:
++                    diff_mask = 0x7fffffff;
+                     diff_value =
+                       bfd_get_signed_32 (abfd,
&contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF8:
+                   case R_XTENSA_NDIFF8:
++                    diff_mask = 0xff;
+                     diff_value =
+                       bfd_get_8 (abfd, &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF16:
+                   case R_XTENSA_NDIFF16:
++                    diff_mask = 0xffff;
+                     diff_value =
+                       bfd_get_16 (abfd, &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF32:
+                   case R_XTENSA_NDIFF32:
++                    diff_mask = 0xffffffff;
+                     diff_value =
+                       bfd_get_32 (abfd, &contents[old_source_offset]);
+                     break;
+                   }
+
+                 if (r_type >= R_XTENSA_NDIFF8
+-                    && r_type <= R_XTENSA_NDIFF32)
+-                  diff_value = -diff_value;
++                    && r_type <= R_XTENSA_NDIFF32
++                    && diff_value)
++                  diff_value |= ~diff_mask;
+
+                 new_end_offset = offset_with_removed_text_map
+                   (&target_relax_info->action_list,
+@@ -9710,43 +9717,40 @@ relax_section (bfd *abfd, asection *sec, struct
bfd_link_info *link_info)
+                 switch (r_type)
+                   {
+                   case R_XTENSA_DIFF8:
+-                    diff_mask = 0x7f;
+                     bfd_put_signed_8 (abfd, diff_value,
+                                &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF16:
+-                    diff_mask = 0x7fff;
+                     bfd_put_signed_16 (abfd, diff_value,
+                                 &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF32:
+-                    diff_mask = 0x7fffffff;
+                     bfd_put_signed_32 (abfd, diff_value,
+                                 &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF8:
+                   case R_XTENSA_NDIFF8:
+-                    diff_mask = 0xff;
+                     bfd_put_8 (abfd, diff_value,
+                                &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF16:
+                   case R_XTENSA_NDIFF16:
+-                    diff_mask = 0xffff;
+                     bfd_put_16 (abfd, diff_value,
+                                 &contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_PDIFF32:
+                   case R_XTENSA_NDIFF32:
+-                    diff_mask = 0xffffffff;
+                     bfd_put_32 (abfd, diff_value,
+                                 &contents[old_source_offset]);
+                     break;
+                   }
+
+-                /* Check for overflow. Sign bits must be all zeroes or
all ones */
+-                if ((diff_value & ~diff_mask) != 0 &&
+-                    (diff_value & ~diff_mask) != (-1 & ~diff_mask))
++                /* Check for overflow. Sign bits must be all zeroes or
++                   all ones.  When sign bits are all ones diff_value
++                   may not be zero.  */
++                if (((diff_value & ~diff_mask) != 0
++                     && (diff_value & ~diff_mask) != ~diff_mask)
++                    || (diff_value && (bfd_vma) diff_value == ~diff_mask))
+                   {
+                     (*link_info->callbacks->reloc_dangerous)
+                       (link_info, _("overflow after relaxation"),
+--
+2.20.1
+
diff --git a/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
b/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handlin
g-for-PR-ld-25861.patch
new file mode 100644
index 0000000000..28f17d7c56
--- /dev/null
+++ b/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handlin
g-for-PR-ld-25861.patch
@@ -0,0 +1,128 @@
+From 735321812435ae278d3766a3371f55937dc776d6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Apr 2020 00:40:25 -0700
+Subject: [PATCH] xtensa: fix XTENSA_NDIFF handling for PR ld/25861
+
+Fields marked with XTENSA_NDIFF relocations are not negated, they only
+have sign bits removed. Don't negate their values when relaxation is
+performed. Don't add sign bits when the value is zero. Report overflow
+when the result has negative sign but all significant bits are zero.
+
+2020-04-29  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+       * elf32-xtensa.c (relax_section): Don't negate diff_value for
+       XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
+       equals 0. Report overflow when the result has negative sign but
+       all significant bits are zero.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: d548f47df4d2e3d117d504a4c9977982c78a0556
+---
+
+ bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index fded42d52a9a..4327b027911f 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct
bfd_link_info *link_info)
+                 switch (r_type)
+                   {
+                   case R_XTENSA_DIFF8:
++                    diff_mask = 0x7f;
+                     diff_value =
+                       bfd_get_signed_8 (abfd,
&contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF16:
++                    diff_mask = 0x7fff;
+                     diff_value =
+                       bfd_get_signed_16 (abfd,
&contents[old_source_offset]);
+                     break;
+                   case R_XTENSA_DIFF32:
++                    diff_mask = 0x7fffffff;
+                     diff_value =
+                       bfd_get_signed_32 (abfd,
&contents[old_source_offset]);
+                     break;
...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200508/8643eed2/attachment-0001.html>
