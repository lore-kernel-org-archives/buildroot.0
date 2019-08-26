From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 23:03:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: security bump version
 to 2.9
In-Reply-To: <20190825192843.21655-1-bernd.kuhls@t-online.de>
References: <20190825192843.21655-1-bernd.kuhls@t-online.de>
Message-ID: <995d10a8-0c25-8911-f8b5-8b65ffd60987@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/08/2019 21:28, Bernd Kuhls wrote:
> Fixes https://w1.fi/security/2019-6/
> 
> Release notes:
> http://lists.infradead.org/pipermail/hostap/2019-April/039979.html
> http://lists.infradead.org/pipermail/hostap/2019-August/040373.html

 In addition to fixing 2019-6, this release adds a ton of features. And we're
bumping two releases here... So I don't think we can classify it as a 'security
bump"...

 Normally we should just take the patches from https://w1.fi/security/2019-6/
like we have all those other patches. However, those patches are based on 2.8
while we still have 2.7, so they probably won't apply cleanly...

 Peter, what do you think?

 Regards,
 Arnout
