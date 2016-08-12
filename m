From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 12 Aug 2016 19:05:16 +0530
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.28.1
In-Reply-To: <20160811223549.50c52467@free-electrons.com>
References: <1470938996-10477-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160811223549.50c52467@free-electrons.com>
Message-ID: <57ADD094.9070102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Friday 12 August 2016 02:05 AM, Thomas Petazzoni wrote:
> Hello,
>
> What is the motivation for this new config option? Just that a new
> --enable-<foo> has appeared in util-linux?

Yes, as per release notes new config option is added.

>
> Also, I'm note quite sure to understand what it does, and therefore if
> the chosen dependencies are correct. Could you give some more details?
>

It is about supporting uuidd in libuuid even if uuidd daemon is disabled.

https://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=3e584e8576aef83f934e8409d07758550dd019cb

I'm not even sure about it's functionality but based on help that is 
available for this config option, I've added it.

Regards,
Rahul
