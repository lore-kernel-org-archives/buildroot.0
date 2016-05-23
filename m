From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 16:54:02 +0200
Subject: [Buildroot] [PATCH next] systemd: bump version to 230
In-Reply-To: <574316D2.5020903@imgtec.com>
References: <1464008187-15431-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160523162800.5dc8b7a5@free-electrons.com>
 <574316D2.5020903@imgtec.com>
Message-ID: <20160523165402.4bb4cb4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 15:42:26 +0100, Vicente Olivert Riera wrote:

> I just read this:
> 
> http://www.phoronix.com/scan.php?page=news_item&px=Systemd-230-FBDEV-Woe
> 
> I don't know how important is this for Buildroot.
> 
> Should we revert this commit?

I am not sure how well the Phoronix article summarizes the problem, but
assuming it is a good summary, my understanding is that they don't
consider this as a bug, and they don't intend to fix it, other than by
having people stop using framebuffer drivers.

So I'd classify this as a "it's upstream decision" rather than as a
bug, but maybe I understand it incorrectly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
