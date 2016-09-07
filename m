From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 7 Sep 2016 20:03:52 -0300 (BRT)
Subject: [Buildroot] [PATCH 6/6] gtest: retrieve package from github
In-Reply-To: <29481_1473259225_57D026D9_29481_7433_1_EEB3FED4859B6C488DDDEC4B2D3DE92B0FCC280F@OPEXCLILM23.corporate.adroot.infra.ftgroup>
References: <1472660696-21640-1-git-send-email-fabrice.fontaine@orange.com>
 <2126371293.3550600.1473170292030.JavaMail.zimbra@datacom.ind.br>
 <96c748a7-e46e-fce4-f4f1-9271928e3468@mind.be>
 <29481_1473259225_57D026D9_29481_7433_1_EEB3FED4859B6C488DDDEC4B2D3DE92B0FCC280F@OPEXCLILM23.corporate.adroot.infra.ftgroup>
Message-ID: <1935714847.3690900.1473289432964.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "fabrice fontaine" <fabrice.fontaine@orange.com>
> To: "Arnout Vandecappelle" <arnout@mind.be>, "Carlos Santos" <casantos@datacom.ind.br>, "Fabrice Fontaine"
> <fontaine.fabrice@gmail.com>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, September 7, 2016 11:40:24 AM
> Subject: RE: [Buildroot] [PATCH 6/6] gtest: retrieve package from github

> Dear Arnout,
> 
> I sent a new patch merging gmock inside gtest.
> However, I did not quite understand what is a "legacy entry", did you mean that
> we should keep a package/gmock/Config.in with a BR2_PACKAGE_GMOCK that should
> enable BR2_PACKAGE_GTEST_GMOCK?

A legacy entry would be an entry in Config.in.legacy, Read the description at
the beginning of that file.

Carlos Santos (Casantos)
DATACOM, P&D
