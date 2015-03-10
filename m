From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 23:35:13 +0100
Subject: [Buildroot] [PATCH] sunxi-mali: require fbset
In-Reply-To: <1426023433-24991-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1426023433-24991-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <20150310233513.5d7906a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerome Oufella,

On Tue, 10 Mar 2015 17:37:13 -0400, Jerome Oufella wrote:
> From: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
> 
> The S80mali startup scripts depends on the presence of the fbset utility
> to configure the display settings. To address this, select
> BR2_PACKAGE_FBSET for the matter.
> 
> Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>

Well, there is also a fbset applet in Busybox, which is enabled in our
default Busybox configuration. So normally, the out of the box user
experience should be just fine.

Are you running without Busybox? Or with a custom Busybox configuration?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
