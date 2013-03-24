From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Mar 2013 11:31:12 -0300
Subject: [Buildroot] [PATCH v4 2/2] strongswan: fix build without IPv6
 support
In-Reply-To: <1360854606-13787-2-git-send-email-jezz@sysmic.org>
References: <20130214143957.1095407a@skate>
 <1360854606-13787-1-git-send-email-jezz@sysmic.org>
 <1360854606-13787-2-git-send-email-jezz@sysmic.org>
Message-ID: <514F0E30.1060506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/14/2013 12:10 PM, J?r?me Pouiller wrote:

> Disable kernel-netlink and socket-default features if toolchain does not
> support IPv6. Also add a comment for this case.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

You could fold this patch into the first one since you're just fixing
something that isn't in tree yet :)
Regards.
