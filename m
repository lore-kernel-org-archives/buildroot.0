From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 12:14:22 +0200
Subject: [Buildroot] [PATCH 1/6] bzip2: improve the packaging
In-Reply-To: <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130528121422.5f9b02e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 28 May 2013 01:00:59 +0200, Thomas Petazzoni wrote:
> Instead of doing some nasty SED tricks, use a patch that modifies the
> bzip2 build system to make it a little bit nicer. Those SEDs were made
> differently for the host and target packages, which is contrary to the
> logic of not having any difference in the source tree between the host
> build and the target build.
> 
> This commit also makes sure that bzip2.mk behaves properly in a
> BR2_PREFER_STATIC_LIB=y context.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This patch should also fix
http://autobuild.buildroot.org/results/91e/91ef29128f9e4e68dd433bd87d61c60852e741b3/build-end.log.

(i.e static build on bfin).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
