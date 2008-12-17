From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 17 Dec 2008 17:45:19 +1100
Subject: [Buildroot] hotplug lsof index libssp
In-Reply-To: <6c8937b20812162140u6138e517n87fe31e24e82b7ba@mail.gmail.com>
References: <6c8937b20812162140u6138e517n87fe31e24e82b7ba@mail.gmail.com>
Message-ID: <20081217064519.GA23637@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 17, 2008 at 01:40:41PM +0800, l m wrote:
> Dear All,
> 
> I've met some problems with recent buildroot versions.
> 
> 1. hotplug: r24435
> "cat package/hotplug/diethotplug-0.5.tar | tar -C
> /opt/buildroot/build_i686   -xf -
> tar: Skipping to next header
> tar: Error exit delayed from previous errors
> make: *** [/opt/buildroot/build_i686/diethotplug-0.5] Error 2"
> 
> I've compared diethotplug-0.5.tar in different buildroot svn versions. In
> r24435 the file size is 40951 Bytes, in another working version, it's 40960
> Bytes. Is it this diethotplug-0.5.tar in r24435 corrupted?

Yes it is. Thanks, I fixed it in r24436.

> 2. lsof
> The default lsof site ftp://lsof.itap.purdue.edu is not valid now. I use

? It looks ok to me.

> 3. index() function
> Some packages still use index(), but default setting doesn't support it. Is

Which packages?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
