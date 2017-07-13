From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 13 Jul 2017 07:49:42 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: disable libfdt swig wrapper
In-Reply-To: <1493697677-24802-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493697677-24802-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1499924982.17019.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, 2017-05-01 at 23:01 -0500, Matt Weber wrote:
> The current tools build assumes the host system
> when trying to detect if swig/python are present.
> It then uses those tools from the path.
> 
> The upstream RFC included this commit set's patch
> but offered up discussion on how to cleanly
> introduce a better method for detecting swig and
> using the tools.  The tools build really needs to
> be sysroot and prefix/host dir tools aware.
> 
> Upsteam submission for RFC:
> https://lists.denx.de/pipermail/u-boot/2017-May/289520.html
> 
> Workaround for:
> http://autobuild.buildroot.net/results/6d5/6d52ac8bb71012aea6fc4c679691b31a3366728b

host-uboot-tools is affected by this issue, too. I run into this issue
after installing swig on my host system when building host-uboot-tools
version 2017.03.

I will send a follow-up patch.

Best regards
J?rg Krause
