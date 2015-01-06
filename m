From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:54:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump to version 0.10.35
In-Reply-To: <1420475737-13153-1-git-send-email-jkrause@posteo.de>
References: <1420475737-13153-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150106215428.4fbe18d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  5 Jan 2015 17:35:36 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/nodejs/nodejs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks!

Since you're doing nodejs stuff, could you have a look at the thread
"[Buildroot] Float error on SAMA5D3 Xplained using nodejs" which
started on December, 5th on the mailing list? I proposed a patch for
nodejs to fix a problem reported by an user, which was tested
successfully, but I never had the time to submit it properly. If you
have some time, could you borrow my patch, and submit it properly after
testing?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
