From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Sep 2016 18:41:28 -0300
Subject: [Buildroot] [PATCH] configs: Add support for Solidrun's MX6
	Cubox/Hummingboard
In-Reply-To: <87eg4mf9w3.fsf@dell.be.48ers.dk>
References: <1473857347-17215-1-git-send-email-fabio.estevam@nxp.com>
 <87eg4mf9w3.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5Ar=VqDXWF8fgx7K4g1faPsc-7T8KXY1=b0KS1Q6hEKJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 14, 2016 at 6:29 PM, Peter Korsgaard <peter@korsgaard.com> wrote:

> Not specific to this defconfig, but I see we don't enable NEON/VFP
> support for any of our i.MX6 defconfigs, even though the A9 cores used
> afaik have both.
>
> Is that something you would care to fix?

Yes, will enable these options on the mx6 defconfig, thanks.
