From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:18:31 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: don't try to use IDN feature
In-Reply-To: <1439469361-31920-1-git-send-email-viallard@syscom-instruments.com>
References: <1439469361-31920-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150818141831.6504f58a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anthony Viallard,

On Thu, 13 Aug 2015 14:36:01 +0200, Anthony Viallard wrote:
> I don't known if there is a consensus about IDN usage for buildroot. I
> didn't see an option in the config about it. I presume IDN should be
> disabled for all package, am I right ?
> 
> autoconf can't see if AI_IDN is really supported (http://sourceforge.net/p/msmtp/code/ci/907916e8089ea9303a7c091b763087530c88a063/).
> It seems weird but this is the case apparently.
> 
> Before I did the above patch, msmtp failed to send mail. The output was:
> 
> msmtp: cannot locate host smtp.mandrillapp.com: Bad value for ai_flags
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> ---
>  package/msmtp/msmtp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
