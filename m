From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 11 Jul 2015 00:48:33 +0200
Subject: [Buildroot] [PATCH 5/7 v2] busybox: adjust configuration to add
 fancy options to the sleep applet
In-Reply-To: <1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <CAHXCMMKxjY7XM5m0Vk36m3L5B4CqOHzja3H44kTG_YjZ16q33g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 9, 2015 at 6:21 PM, Sylvain Raybaud
<sylvain.raybaud@green-communications.fr> wrote:
> Set CONFIGURE_FEATURE_FANCY_SLEEP and CONFIG_FEATURE_FLOAT_SLEEP so that sleep accept floating point arguments.
> This add 492 bytes to the busybox binary compiled for arm or 2748 bytes when compiled for i386.
>
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
