From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 12:33:24 -0300
Subject: [Buildroot] [PATCH] util-linux: disable installing binaries by
 default
In-Reply-To: <1335367559.2428.16.camel@sven>
References: <1335359709-26898-1-git-send-email-gustavo@zacarias.com.ar>
 <1335364003.2428.14.camel@sven>
 <2cb3fdaa67b81857b507a44dacdc154d@zacarias.com.ar>
 <1335367559.2428.16.camel@sven>
Message-ID: <52407d1b40cff9f9bdcaf8600142ab44@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25 12:25, Sven Neumann wrote:

> Or add code that installs the blkid utility if
> BR2_PACKAGE_UTIL_LINUX_LIBUUID is selected:

I sent v2 with the blkid/uuid utilities not mentioned any more in 
Config.in
If utilities are enabled they'll be installed since lib* are now forced 
on as per Thomas's suggestion on IRC when utilities are.
Looking forward we should probably make a "useful" and "useless" tools 
options since mkfs.minixfs and tools such as that are mostly useless in 
embedded systems.
Regards.
