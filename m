From: Christophe Blaess <mailist@logilin.fr>
Date: Wed, 15 Jan 2020 09:54:16 +0100
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <20200115090044.5b9d56d0@windsurf>
References: <20200114220401.61700031@windsurf>
 <CAFOYHZAq0Yrhg10m+U5UNa5+YRY+gcqDQ9K8sE+Sjg1P32edWQ@mail.gmail.com>
 <20200115090044.5b9d56d0@windsurf>
Message-ID: <a299da2b-3b31-d9d3-ebbd-7c67b731ffe7@logilin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> However, what I am proposing is not going that far. All what I'm
> proposing is that if you're doing a clean build, if a package points to
> a Git branch as an upstream source, then Buildroot would re-fetch from
> that Git branch rather than using a locally cached tarball in DL_DIR
> potentially corresponding to an older version of that Git branch.

Would it be possible to have an option on a per-package basis to always 
by-pass the DL_DIR mechanism and re-fetch the sources?

-- 

Christophe Blaess

https://www.logilin.fr
