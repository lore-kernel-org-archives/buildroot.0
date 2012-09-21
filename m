From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 08:37:36 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C4E1A.7000809@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
Message-ID: <505C5180.10105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 08:23, Arnout Vandecappelle wrote:

>  But the final link will fail because of undefined fuse_xxx symbols,
> because there is no -lfuse added by pkg-config.

Yes, that's why i Acked your patch, it IS a problem.
It's just not the problem stated in the commit msg about the
autobuilders not detecting it (host-pkg-config almost always present,
that changes nothing as long as there's a pkg-config around) :)
Regards.
