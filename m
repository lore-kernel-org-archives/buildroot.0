From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2017 14:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] alljoyn: fix build on or1k
In-Reply-To: <1487339732-29587-1-git-send-email-fabrice.fontaine@orange.com>
References: <1487339732-29587-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20170217145942.28eed5ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 14:55:32 +0100, Fabrice Fontaine wrote:
> Fixes missing stdio.h include in ConfigServiceSample
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c48/c486397a6a99f6b377cfc0d971b716fe5d69f662
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Do we understand why it's happening only on or1k ?

or1k is using some gcc 5.x compiler, so we should see the same problem
with other gcc 5.x toolchains, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
