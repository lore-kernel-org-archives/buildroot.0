Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14123C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6AD607F9;
	Fri,  7 Jan 2022 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bw7FlT-eh6XT; Fri,  7 Jan 2022 20:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 528F460AE4;
	Fri,  7 Jan 2022 20:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB461BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4990A8174D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mailoo.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mn4J2x2ywvZX for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:29:26 +0000 (UTC)
X-Greylist: delayed 00:20:35 by SQLgrey-1.8.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C5BB814AB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1641586127; bh=Lk88Z0xdYLBUlrzlKRp81Lq+2LgBH4IzTzjIe769YnQ=;
 h=X-EA-Auth:From:To:Cc:Date:Subject:MIME-Version:X-Mailer:
 Message-ID:In-Reply-To:Content-Type;
 b=TmlS4zPt3TOAGPd4sKvWLwnMPdN2eDYF6GaqIOnwTW39hVdPOKaNhi1xY/tMCd+hg
 Q7BmfGG6ezJQh71Z/IJivZD0O6voJ+e+0wVK5iKDQaNsiNBTHRW5Jv4kVuxdh6wlAf
 MHUrkCiSCj0p07sDBqc08JcV2qtUa7dVTI8hT878=
Received: by www-7.net-c.com with http webmail; Fri,  7 Jan 2022
 21:08:47 +0100 (CET)
X-EA-Auth: qy0zHveZshb+APtxPFYQtmpBVVxJLMjGOP28p0XcEtmH6wk1747642SyYZLwk2BpJ88UFTwPcS3M8tSC9rE+v2tV+btx1+4q
From: marc.chalain@mailoo.org
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Romain Naour" <romain.naour@smile.fr>
Date: Fri,  7 Jan 2022 21:08:47 +0100 (CET)
X-Priority: 3
MIME-Version: 1.0
X-Mailer: COMS/EA21.01/r20211110
Message-ID: <ea-mime-61d89dcf-4dd2-23b57646@www-7.net-c.com>
In-Reply-To: <20220106103759.1166357c@windsurf>
Subject: Re: [Buildroot] package/aravis: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marc Chalain <marc.chalain@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6692738860759897383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6692738860759897383==
Content-Type: multipart/alternative;
 boundary="----=_NextPart_001_61d89dcf_4dd2_164457e4"

------=_NextPart_001_61d89dcf_4dd2_164457e4
Content-Type: text/plain;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank for all,

I will send a new version quickly, but some questions first:



> +ARAVIS_VERSION =3D 0.8.16

Aravis project is moving fast, there is a new version 0.8.20 already.
I'm fine with this version since it was released recently:
https://github.com/AravisProject/aravis/releases/tag/0.8.16


The 0.8.16 is available from June 2021. I had clearly well tested this ver=
sion with several kernel configuration. What is it better ? the last versio=
n or the most tested version ?

To send 0.8.20 I will need few weeks, to test.



> +ARAVIS_SITE =3D $(call github,AravisProject,aravis,$(ARAVIS_VERSION))
> +ARAVIS_DEPENDENCIES =3D \
> +=C2=A0=C2=A0=C2=A0 host-pkgconf \
> +=C2=A0=C2=A0=C2=A0 libglib2 \
> +=C2=A0=C2=A0=C2=A0 libxml2

There is a list of dependencies in the Readme:

https://github.com/AravisProject/aravis/blob/main/README.md#install-depend=
encies-on-ubuntu-2004

especially gstreamer and plugins etc..


This rules is just for GigE Camera and not USB3Vision. I haven't tested th=
is feature. The gstreamer is not mandator, it is only for the viewer. I am =
focused on Embeded system without any kind of display.

If the gstreamer or libusb3 are availables, meson is able to detect and ad=
d them during the configuration process.

To add as dependencies, forces to build the optionals features.

What's the best ?



Thank you., best regards,

Marc.







De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
=C3=80 : Romain Naour <romain.naour@smile.fr>
Sujet : Re: [Buildroot] package/aravis: new package
Date : 06/01/2022 10:37:59 Europe/Paris
Copie =C3=A0 : marc.chalain@mailoo.org;
=C2=A0=C2=A0=C2=A0buildroot@buildroot.org;
=C2=A0=C2=A0=C2=A0Eric Le Bihan <eric.le.bihan.dev@free.fr>;
=C2=A0=C2=A0=C2=A0Marc Chalain <marc.chalain@gmail.com>

Hello,

On Thu, 6 Jan 2022 10:24:53 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > diff --git a/package/aravis/Config.in b/package/aravis/Config.in
> > new file mode 100644
> > index 0000000000..02c71c44da
> > --- /dev/null
> > +++ b/package/aravis/Config.in
> > @@ -0,0 +1,16 @@
> > +config BR2_PACKAGE_ARAVIS
> > +=C2=A0=C2=A0=C2=A0 bool "aravis - GigE Camera"

Just:

bool "aravis"

> > +=C2=A0=C2=A0=C2=A0 depends on BR2_USE_WCHAR
> > +=C2=A0=C2=A0=C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > +=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_16
> > +=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_32

Please use "select" for pcre.

> > +ARAVIS_LICENSE_FILES =3D COPYING
> > +ARAVIS_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)=20
>=20
> Is gettext a mandatory dependency ?
> At least gettext should be in ARAVIS_DEPENDENCIES when NLS support is en=
abled.

No, don't add gettext directly, use $(TARGET_NLS_DEPENDENCIES), which
will automatically add (or not) host-gettext and/or gettext to the
dependencies, depending on when it's needed or not.

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com


------=_NextPart_001_61d89dcf_4dd2_164457e4
Content-Type: text/html;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank for all,</div><div>I will send a new version quickly, but some q=
uestions first:<br></div><div dir=3D"ltr"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
 204, 204);padding-left:1ex;"><div dir=3D"ltr"><span class=3D"gmail-im">&gt=
; +ARAVIS_VERSION =3D 0.8.16<br>
<br></span>
Aravis project is moving fast, there is a new version 0.8.20 already.<br>
I'm fine with this version since it was released recently:<br>
<a href=3D"https://github.com/AravisProject/aravis/releases/tag/0.8.16" re=
l=3D"noreferrer noopener">https://github.com/AravisProje<wbr>ct/aravis/rele=
ases/tag/0.8.16</a><span class=3D"gmail-im"><br>
<br></span></div></blockquote><div>The 0.8.16 is available from June=20
2021. I had clearly well tested this version with several kernel=20
configuration. What is it better ? the last version or the most tested=20
version ?</div><div>To send 0.8.20 I will need few weeks, to test.</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204, 204, 204);padding-left:1ex;"><div dir=
=3D"ltr"><span class=3D"gmail-im">
&gt; +ARAVIS_SITE =3D $(call github,AravisProject,aravis,$(<wbr>ARAVIS_VER=
SION))<br>
&gt; +ARAVIS_DEPENDENCIES =3D \<br>
&gt; +=C2=A0=C2=A0=C2=A0 host-pkgconf \<br>
&gt; +=C2=A0=C2=A0=C2=A0 libglib2 \<br>
&gt; +=C2=A0=C2=A0=C2=A0 libxml2<br>
<br></span>
There is a list of dependencies in the Readme:<br>
<br>
<a href=3D"https://github.com/AravisProject/aravis/blob/main/README.md#ins=
tall-dependencies-on-ubuntu-2004" rel=3D"noreferrer noopener">https://githu=
b.com/AravisProje<wbr>ct/aravis/blob/main/README.md#<wbr>install-dependenci=
es-on-<wbr>ubuntu-2004</a><br>
<br>
especially gstreamer and plugins etc..<span class=3D"gmail-im"><br>
<br>
</span></div></blockquote><div>This rules is just for GigE Camera and=20
not USB3Vision. I haven't tested this feature. The gstreamer is not=20
mandator, it is only for the viewer. I am focused on Embeded system=20
without any kind of display.</div><div>If the gstreamer or libusb3 are ava=
ilables, meson is able to detect and add them during the configuration proc=
ess.</div><div>To add as dependencies, forces to build the optionals featur=
es.</div><div>What's the best ?</div><div><br></div><div>Thank you., best r=
egards,</div><div>Marc.</div><div><br><br></div><br><br><br><blockquote typ=
e=3D"cite" style=3D"margin:0 0 0 0.5em;border-left:1px #00f solid;padding-l=
eft:1em;">De : Thomas Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;<br>
=C3=80 : Romain Naour &lt;romain.naour@smile.fr&gt;<br>
Sujet : Re: [Buildroot] package/aravis: new package<br>
Date : 06/01/2022 10:37:59 Europe/Paris<br>
Copie =C3=A0 : marc.chalain@mailoo.org;<br>
=C2=A0=C2=A0=C2=A0buildroot@buildroot.org;<br>
=C2=A0=C2=A0=C2=A0Eric Le Bihan &lt;eric.le.bihan.dev@free.fr&gt;;<br>
=C2=A0=C2=A0=C2=A0Marc Chalain &lt;marc.chalain@gmail.com&gt;<br>
<br>
Hello,<br>
<br>
On Thu, 6 Jan 2022 10:24:53 +0100<br>
Romain Naour &lt;romain.naour@smile.fr&gt; wrote:<br>
<br>
&gt; &gt; diff --git a/package/aravis/Config.in b/package/aravis/Config.in=
<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..02c71c44da<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/aravis/Config.in<br>
&gt; &gt; @@ -0,0 +1,16 @@<br>
&gt; &gt; +config BR2_PACKAGE_ARAVIS<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 bool &quot;aravis - GigE Camera&quot;<br>
<br>
Just:<br>
<br>
	 bool &quot;aravis&quot;<br>
<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 depends on BR2_USE_WCHAR<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL<br=
>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_16<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_32<br>
<br>
Please use &quot;select&quot; for pcre.<br>
<br>
&gt; &gt; +ARAVIS_LICENSE_FILES =3D COPYING<br>
&gt; &gt; +ARAVIS_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)  <br>
&gt; <br>
&gt; Is gettext a mandatory dependency ?<br>
&gt; At least gettext should be in ARAVIS_DEPENDENCIES when NLS support is=
 enabled.<br>
<br>
No, don't add gettext directly, use $(TARGET_NLS_DEPENDENCIES), which<br>
will automatically add (or not) host-gettext and/or gettext to the<br>
dependencies, depending on when it's needed or not.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noopener">https://bootli=
n.com</a><br></blockquote>

------=_NextPart_001_61d89dcf_4dd2_164457e4--



--===============6692738860759897383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6692738860759897383==--


