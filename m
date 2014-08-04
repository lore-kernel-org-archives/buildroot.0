From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 21:38:50 +0200
Subject: [Buildroot] [PATCH] exim: security bump to version 4.83
In-Reply-To: <1407180895-25908-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407180895-25908-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140804213850.5c9bd355@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  4 Aug 2014 16:34:55 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-2972 - prevent double expansion in math comparison
> functions (can expand unsanitized data).
> Also rename patches according to patch naming policy.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
