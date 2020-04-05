From: Stefan Ott <stefan@ott.net>
Date: Sun, 5 Apr 2020 18:24:35 +0200
Subject: [Buildroot] [PATCH v2] unbound: new package
In-Reply-To: <20200404233916.7ab3246b@windsurf.home>
References: <20200329180016.9292-1-stefan@ott.net>
 <20200404233916.7ab3246b@windsurf.home>
Message-ID: <20200405162435.GA628@greebo.asti.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, Apr 04, 2020 at 11:39:16PM +0200, Thomas Petazzoni wrote:
> 
> By convention, we like to have "depends on" before "select". This type
> of coding style convention is verified by "make check-package".
> 
> Also, when there is a dependency on a toolchain feature like this, we
> add a Config.in comment:
> 
> comment "unbound needs a toolchain w/ dynamic library"
> 	depends on BR2_STATIC_LIBS
> 
> I've fixed both small issues and applied.

Thank you.

-- 
Stefan Ott
https://www.ott.net/
