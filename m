From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 21 Mar 2016 20:17:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-20
In-Reply-To: <20160321073023.C428D1023A9@stock.ovh.net>
References: <20160321073023.C428D1023A9@stock.ovh.net>
Message-ID: <1458587832.7413.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2016-03-21 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2016-03-20
> ===============================
> 
> Detail of failures
> ===================
> 
> ????????sh4a |???????????????????prboom-2.5.0 | NOK |
> http://autobuild.buildroot.net/results/2f14075e22b420cc3fdaaa2231494f
> 2829f040ec/
> ????????sh4a |???????????????????prboom-2.5.0 | NOK | http://autobuil
> d.buildroot.net/results/d3030fea0b3b8693be640754774e50ac064f8c89/

Internal compiler error:

r_fps.c: In function 'R_StopAllInterpolations':
r_fps.c:296:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.

I will send a patch which
disables?BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH for prboom.

Best regards
J?rg Krause
