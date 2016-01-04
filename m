From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jan 2016 16:24:21 +0100
Subject: [Buildroot] [PATCH 1/1] disable reboot by ctrl-alt-del
In-Reply-To: <87r3hxjru4.fsf@dell.be.48ers.dk>
References: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
 <20160104160337.402c3aef@free-electrons.com>
 <87r3hxjru4.fsf@dell.be.48ers.dk>
Message-ID: <20160104162421.3d15a8ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Jan 2016 16:18:43 +0100, Peter Korsgaard wrote:

> Ehh, I think we all agree. This commit didn't add a configuration
> option, it simply changed our default behavior to NOT do anything when
> ctrl-alt-del is pressed (which is imho a better default).

Ah, my bad. I had in mind the previous patch from Lothar, i.e "added
option to enable or disable reboot on ctrl-alt-del". Indeed his new
patch, which you committed, does not add a new option, which is
perfectly fine.

Sorry for the noise. That's what happens when you don't read e-mails in
the right order.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
