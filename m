From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:50:30 +0200
Subject: [Buildroot] [PATCH] polarssl: remove on security grounds
In-Reply-To: <1477661811-32653-1-git-send-email-gustavo@zacarias.com.ar>
References: <1477661811-32653-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161029155030.36f92ec5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 10:36:51 -0300, Gustavo Zacarias wrote:
> The 1.2.x branch is no longer maintained and the latest release from the
> maintained branches (2.3, 2.1, 1.3) were security releases, so more
> likely than not 1.2 is affected.
> In consequence switch shairport-sync to the openssl backend.

The question that immediately comes to mind is: if 1.2 is no longer
security-maintained, why don't we package the newer versions such as
2.3 ?

I guess it's because polarssl 2.3 doesn't exist, and it's called
mbedtls instead. But it would be good to get your confirmation, and
have this written clearly in the commit log, and Config.in.legacy help
text.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
