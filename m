From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:28:48 +0200
Subject: [Buildroot] [PATCH 1/4] freerdp: Add support for tz package
In-Reply-To: <BLU436-SMTP472EF27D5E879E3FFB5134C7840@phx.gbl>
References: <BLU436-SMTP472EF27D5E879E3FFB5134C7840@phx.gbl>
Message-ID: <20150721232848.489afa47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear FanChengPing,

Could you fix your setup so that the From: and Signed-off-by: are
matching, and are the same for every patch?

In this current version you posted, the first two patches have:

From: FanChengPing <vancepym@outlook.com>
Signed-off-by: Scott Fan <fancp2007@gmail.com>

(which is not good)

and the last two patches have:

From: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Scott Fan <fancp2007@gmail.com>

which is good.

Also, when posting new version, please add a version number to your
patches, by using:

	git format-patch --subject-prefix="PATCH v2"

as well as a changelog between the versions, either in a cover letter
e-mail (--cover argument of git format-patch) or in the individual
patches. See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for more details.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
