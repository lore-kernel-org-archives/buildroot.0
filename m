From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 23:01:25 +0100
Subject: [Buildroot] [PATCH v6] rfkill: new package
In-Reply-To: <1446019363-21526-1-git-send-email-sv99@inbox.ru>
References: <1446019363-21526-1-git-send-email-sv99@inbox.ru>
Message-ID: <20151222230125.5b242c49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

On Wed, 28 Oct 2015 11:02:43 +0300, Viacheslav Volkov wrote:
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> ---
> Changes v5 -> v6:
>   - change RFKILL_LICENSE_FILE -> RFKILL_LICENSE_FILES (suggested by Jerzy Grzegorek)

I've applied after doing a minor change:

    [Thomas: use "br" as the version suffix instead of "-br" so that the
    final version string is "0.5-br" and not "0.5--br".]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
