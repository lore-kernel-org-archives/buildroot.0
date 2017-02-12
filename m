From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Feb 2017 19:08:48 +0100
Subject: [Buildroot] [PATCH 3/3] package/lugaru: new package
In-Reply-To: <1482088837-3388-3-git-send-email-romain.naour@gmail.com>
References: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
 <1482088837-3388-3-git-send-email-romain.naour@gmail.com>
Message-ID: <865eecd4-c2f4-e195-58f0-73b165413986@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 18/12/2016 ? 20:20, Romain Naour a ?crit :
> Lugaru needs SDL2 library with OpenGL support which require X11 support.
> Otherwise Lugaru error out with "No dynamic GL support in video driver"
> message.
> 
> https://osslugaru.gitlab.io/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

A new Lugaru release is out (1.2), I'll resend an updated series.

Also test-pkg script reveal some build issue with Lugaru which needs to be fixed
first.

Best regards,
Romain
