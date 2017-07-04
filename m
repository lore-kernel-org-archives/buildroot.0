From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:08:14 +0200
Subject: [Buildroot] [PATCH] crda: enable staging install
In-Reply-To: <20170704163412.13728-1-maxime.hadjinlian@gmail.com>
References: <20170704163412.13728-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704190814.5964a87e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:34:11 +0200, Maxime Hadjinlian wrote:
> It's needed to make mklibs work otherwise it can't find the missing
> library for the crda binary.

What is this mklibs thing? Why does it matter? We need a better
justification for this change :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
