From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 22 Jan 2011 12:54:01 +0100
Subject: [Buildroot] [PATCH v2 0/4] Introducing CMAKETARGETS
	infrastructure
In-Reply-To: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTikba1wEwQMdJ5DXkJ47CQ_Yo3XEvrdEw5qA_ygQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/1/15 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> This patch series adds a new infrastructure for CMake packages called
> CMAKETARGETS. It is based on the AUTOTARGETS infrastructure.

No comments? Is that good or bad? :-)

I plan on disabling ccache for the CMake infrastructure, like Peter
did with cdrkit. Anything else that should be in v3 so it can be
merged?

Best regards,
Bj?rn Forsman
