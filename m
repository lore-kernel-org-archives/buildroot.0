From: Geoff Levand <geoff@infradead.org>
Date: Fri, 29 Apr 2016 14:26:00 -0700
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <20160421224301.6a05f711@free-electrons.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
Message-ID: <1461965160.27026.9.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-04-21 at 22:43 +0200, Thomas Petazzoni wrote:
> Now that those patches have been merged, we're starting to see some
> build issues:
> 
>  - With host-go:
>    http://autobuild.buildroot.org/?reason=host-go-1.5.3
> 
>  - With flannel:
>    http://autobuild.buildroot.org/?reason=flannel-v0.5.5

Just to give an update, I've got fixes for the host-go problems,
and am working on the flannel problem.

WIP patches are in my master branch here:

  git at github.com:glevand/buildroot--buildroot.git

-Geoff
