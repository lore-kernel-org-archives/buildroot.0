From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 10 Mar 2013 20:19:49 -0300
Subject: [Buildroot] [PATCH] quota: select
	BR2_PACKAGE_UTIL_LINUX_BINARIES
In-Reply-To: <87wqtevreo.fsf@dell.be.48ers.dk>
References: <1362907622-27511-1-git-send-email-gustavo@zacarias.com.ar>
 <87wqtevreo.fsf@dell.be.48ers.dk>
Message-ID: <513D1515.9050303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2013 07:09 PM, Peter Korsgaard wrote:
> Ehh, that log rather looks like BR2_PACKAGE_UTIL_LINUX_MOUNT needing to
> select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT?

I'd rather get all the libs enabled when any binaries are wanted.
Otherwise for each util-linux bump a full study of those details will
need to be done.
It's not like the libs take that much space....
And otherwise it'll be a hidden option without BINARIES being selected.
Regards.
