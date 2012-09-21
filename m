From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 08:15:58 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C4C17.2000701@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
Message-ID: <505C4C6E.50702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 08:14, Arnout Vandecappelle wrote:
>  No, unless libfuse-dev is installed on the autobuilders. 
> /usr/bin/pkg-config
> doesn't look in $(STAGING_DIR)...

I'm on gentoo so -dev doesn't exist in my world, it's builtin :)
Regards.
