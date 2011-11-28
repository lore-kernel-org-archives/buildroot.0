From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 28 Nov 2011 09:46:00 +0100
Subject: [Buildroot] [PATCH 04/15] package: add <pkg>-rebuild	and
	<pkg>-reconfigure
In-Reply-To: <20111128091242.39ef2487@skate>
References: <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826231.git.thomas.petazzoni@free-electrons.com>
 <4EB3B403.4020404@relinux.de> <4ED2783B.1010205@relinux.de>
 <20111128091242.39ef2487@skate>
Message-ID: <4ED34A48.8040202@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.11.2011 09:12, schrieb Thomas Petazzoni:
> I am just wondering why we would document the <pkg>-rebuild and
> <pkg>-reconfigure targets in the help text and not all the other
> <pkg>-* targets.
Good point.

When I started with buildroot, I was missing an easy procedure to
rebuild packages and found these two targets in your Patch from August
31 more or less by accident. So I decided to add some description for these.

Stephan
> Thomas
