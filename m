From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 21 Nov 2018 19:57:55 +0100
Subject: [Buildroot] [PATCH 2/2] libostree: bump to version 2018.9.1
In-Reply-To: <20181120214824.9541-2-fontaine.fabrice@gmail.com>
References: <20181120214824.9541-1-fontaine.fabrice@gmail.com>
 <20181120214824.9541-2-fontaine.fabrice@gmail.com>
Message-ID: <20181121185755.GB1458@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 20, 2018 at 10:48:24PM +0100, Fabrice Fontaine wrote:
> Bump to v2018.9 added ostree-finalize-staged.path through
> https://github.com/ostreedev/ostree/commit/ac1a919ffd4fe944d06c4f4510604baa73d1bf8e
> 
> However, this file was not added in the tarball until commit:
> https://github.com/ostreedev/ostree/commit/62594765b2fae72e332ffb21fbd11085d911ef83
> 
> So use the new 2018.9.1 tarball to get this file otherwise build with
> systemd will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fc6435282630e60927f88bf5954805ebbaa60cb3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
