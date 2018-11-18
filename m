From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 21:56:10 +0100
Subject: [Buildroot] [PATCH 1/2] imx-uuc: needs headers >= 3.18
In-Reply-To: <20181118193512.11215-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 20:35:11 +0100")
References: <20181118193512.11215-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm6mm7f9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Bump to 79e9798eee9cd972d92ed2b18f170de856d153c9 added the following
 > commit:
 > https://github.com/NXPmicro/imx-uuc/commit/ce808f3010ec73ccc07775c6cfd5317807a22415

 > This new ufb daemon uses usb_functionfs_descs_head_v2 which is available
 > only since 3.18:
 > https://github.com/torvalds/linux/commit/1df22b4ea9d91b01267fb61c155c31fb65d6b8a0

 > So add a dependency on headers >= 3.18

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1081062b1c32c44a9feb5b14288095bc72d15986

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
