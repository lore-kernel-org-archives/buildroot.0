From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Wed, 19 May 2021 13:31:20 +0000
Subject: [Buildroot] [External] Re: [PATCH 1/1] package/libopenssl: add
 option to enable some features
In-Reply-To: <20210516170955.GP2506@scaer>
References: <20200511132133.738039-1-erwan.gautron@bertin.fr>,
 <20210516170955.GP2506@scaer>
Message-ID: <DM2P110MB01051BDEDB77556563850C07F22B9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erwan,

On 2020-05-11 15:21 +0200, Erwan GAUTRON spake thusly:
> From: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
> 
> Openssl implements lot of algorithms that are not required in
> some emdedded devices and cyphers known as weak.
> Secure embedded systems shall disable unused algorithms (and weak algo)
> in order to be certified.
> This patch allows to select weak algorithms and mecanims to enable
> such as md5
> To ensure backward compatibility, all items are selected by default
> 
> Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>

I noticed a build failure related to no-md5.  Were there cases where some of these weren't defined?

http://autobuild.buildroot.net/results/9d79c9f313ff989449e9b47c1ff0afd3a167fd2d/

Regards,
Matt
