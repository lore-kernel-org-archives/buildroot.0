From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 08:49:37 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com>
 <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer>
 <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
Message-ID: <20181218084937.47142880@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Dec 2018 23:59:04 +0100, Arnout Vandecappelle wrote:

>  Which brings me to my question to Chris: what was the purpose of this patch to
> begin with? Since OPENSSH_USERS is already set, the sshd user will already exist
> in /etc/passwd, so the sysusers.d directive will be ignored... Either that, or
> our mkusers script doesn't work correctly.

Stateless systems, where /etc and /var don't even "exist" in a
persistent fashion, and are entirely populated at boot time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
