From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 4 Oct 2016 20:06:44 -0300
Subject: [Buildroot] [PATCH] elfutils: clarify licensing info
In-Reply-To: <57F3A834.6090300@imgtec.com>
References: <1475577852-15870-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <57F3A834.6090300@imgtec.com>
Message-ID: <798633b6-2ff6-45d4-ad74-be9702c1ea4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/16 10:01, Rahul Bedarkar wrote:

> Hi,
>
> License string should be GPLv2+ instead of GPLv2 because license header
> uses clause "either version 2 of the License, or (at your option) any
> later version". With that license string for library is "GPLv2+ or LGPLv3+"

Right, fixed for v2.

> There is same if condition down. Instead we should conditionally add
> license there.

Missed that optimization, fixed.

>> +ELFUTILS_LICENSE += GPLv3+ (programs)
>
> Since it is separate component, it should be comma separated.
>
> ELFUTILS_LICENSE := $(ELFUTILS_LICENSE), GPLv3+ (programs)

Most packages don't do this correctly, only a few do and i've used those 
as example, though it's no excuse. Care to fix the others?
Regards.
