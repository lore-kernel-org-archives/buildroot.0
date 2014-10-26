From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 21:52:22 +0100
Subject: [Buildroot] [PATCH] zlog: Add patch to remove -Werror
In-Reply-To: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20141026215222.1bf25872@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sun, 26 Oct 2014 16:34:39 -0300, Ezequiel Garcia wrote:

> +Instead of trying to fix the macro, let's fix the real issue here,
> +and remove -Werror.

I actually think the real problem should also be fixed :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
