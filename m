From: David Wagner <david.wagner@free-electrons.com>
Date: Tue, 17 May 2011 15:00:19 +0200
Subject: [Buildroot] [PATCH] Add support for local packages
 through	'file://' pseudo-protocol
In-Reply-To: <1305636603-12726-1-git-send-email-david.wagner@free-electrons.com>
References: <1305636603-12726-1-git-send-email-david.wagner@free-electrons.com>
Message-ID: <4DD27163.1040900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/2011 02:50 PM, david.wagner at free-electrons.com wrote:
> From: David Wagner <david.wagner@free-electrons.com>
>
> Can be useful to integrate a home-made project or for testing purposes.
> The default command to retrieve files is 'cp' but 'rsync' could also
be used.
> Through sshfs, it should also be possible to get non-public remote
files on a
> ssh server.

Sorry for the "raw" format of this submit. I guess I haven't figured out
yet how to add an introductory text with git send-email.

I needed the submitted feature to add a tool that wasn't easily
available as tarball (logfsprogs: Thomas showed me how to override the
download method but I couldn't have figured it out otherwise). But there
are other use-cases, like the ones in the commit message.

I hope the patch is ok, tell me if not.

Regards,
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
