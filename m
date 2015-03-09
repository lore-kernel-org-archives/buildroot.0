From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 21:43:36 +0100
Subject: [Buildroot] [PATCH v2] libdri2: new package
In-Reply-To: <87oao257gc.fsf@pcjo.localdomain>
References: <1425906775-31621-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <20150309153619.0f316d11@free-electrons.com>
 <87oao257gc.fsf@pcjo.localdomain>
Message-ID: <20150309214336.644f3f15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Oufella,

On Mon, 09 Mar 2015 14:52:51 -0400, J?r?me Oufella wrote:

> I tried in v1, but the macro would ultimately fail due to lack of
> archive on github. Or is there something I missed ?

Well, the github macro should work with any commit. See for example:

A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
