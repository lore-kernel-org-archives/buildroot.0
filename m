From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Oct 2013 21:21:12 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
	berkeleydb 6
In-Reply-To: <20131007145734.781254cd@skate>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <5252A958.6010001@zacarias.com.ar> <20131007145734.781254cd@skate>
Message-ID: <19200344.E3SpUQhgg0@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 07 October 2013 14:57:34 Thomas Petazzoni wrote:
[...]
> Ok, so as discussed on IRC, my proposal would be:
> 
>  * Downgrade the berkeleydb package to the last known non-AGPL version
> (i.e essentially revert commit
>    4c478de2e76ffc1d0a6dc413475307fd44a0a595). This way, all existing
>    packages in Buildroot that rely on berkeleydb continue to work with
> no change, and don't create a legal issue. Add a comment in the
> berkeleydb.mk file that explains why it shouldn't be bumped to v6 of
> the project.
> 
>  * If someone cares, integrate an additional berkeleydb6 package that
>    packages the v6 of berkeleydb under AGPL.
> 
> J?r?me, are you interested in doing such work?
I don't care of version of berkeleydb. 

But, I can send revert commit :-)


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
