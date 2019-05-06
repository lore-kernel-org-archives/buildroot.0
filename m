From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 May 2019 11:10:56 +0200
Subject: [Buildroot] [PATCH 3/3] package/strace: add patch for nds32
 support
In-Reply-To: <20190506090411.9453-3-nylon7@andestech.com>
References: <20190506090411.9453-1-nylon7@andestech.com>
 <20190506090411.9453-3-nylon7@andestech.com>
Message-ID: <20190506111056.7d26c1e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 May 2019 17:04:11 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Fixes:
>   http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
>   http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb
> 
> Signed-off-by:vincentc <vincentc@andestech.com>

We need a full name: first name + last name. Also the first
Signed-off-by needs to match with the commit author.

> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  package/strace/0001-Add-nds32-porting.patch | 490 ++++++++++++++++++++

Has this patch been submitted to the upstream strace project ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
