From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 25 Nov 2017 14:18:36 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20171125114643.5b290738@windsurf.lan>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
 <20171124215828.47855fdd@windsurf.lan> <20171125103252.GA1248@hpx>
 <20171125114643.5b290738@windsurf.lan>
Message-ID: <20171125111836.GA1303@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Nov 25, 2017 at 11:46:43AM +0100, Thomas Petazzoni wrote:
> I have already applied your patch. So if any fix is needed, please base
> your new patch on top of the "next" branch.

When the original patch was submitted, it was the only patch applied to
hostapd. But the recent security fixes added two more patches. So we
need to replace HOSTAPD_PATCH= with HOSTAPD_PATCH+=.

I've just sent a correction patch based on the top of the 'next' branch.

-- 
Best regards,
Alexander.
