From: Ben Boeckel <mathstuf@gmail.com>
Date: Thu, 12 Nov 2015 20:37:33 -0500
Subject: [Buildroot] [PATCH] makefile: remove LD_LIBRARY_PATH from the
	environment
In-Reply-To: <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20151113013733.GA17107@bronto-burt.dev.benboeckel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 28, 2015 at 22:48:15 -0400, Ben Boeckel wrote:
> If system tools are selected, the host's lib/ directory may shadow
> libraries from the system which are configured differently and do not
> have all of the symbols required by the system tool.
> 
> Since buildroot uses rpath everywhere, LD_LIBRARY_PATH should not be
> necessary anyways.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Bump.

--Ben
