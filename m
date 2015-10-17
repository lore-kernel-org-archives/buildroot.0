From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:30:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Add optional
 dependencies
In-Reply-To: <1445085118-8020-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445085118-8020-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151017163018.537a9963@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Oct 2015 14:31:58 +0200, Bernd Kuhls wrote:
> Disable libcdio and libilbc since they are incompatible with ffmpeg.

It isn't really clear what you mean by "they are incompatible with
ffmpeg". Are you talking about the specific version of those libraries
we have in Buildroot?

Nonetheless, I've applied the patch since it's reasonable to explicitly
disable libraries for which we don't have support at the moment.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
