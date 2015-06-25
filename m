From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 06:32:40 +0200
Subject: [Buildroot] [PATCH] nginx: fix nginx.old clean-up
In-Reply-To: <1435203169-3930-1-git-send-email-danomimanchego123@gmail.com>
References: <1435203169-3930-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAHXCMMJoO_8F=AfvjR4WzxO_rLuonWkfWsP3pFTSTD5bMVf+xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 25, 2015 at 5:32 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> The bin path for nginx is configured for /usr/sbin, so deleting
> the nginx.old back-up from /usr/bin never works.  Fix path, and
> also use "$(RM)" instead of "-$(RM)", as "rm -f" never fails.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
