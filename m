From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:12:26 +0100
Subject: [Buildroot] [PATCH v4 2/2] grpc: new package
In-Reply-To: <20181129062140.10474-2-robertroyrose@gmail.com>
References: <20181129062140.10474-1-robertroyrose@gmail.com>
 <20181129062140.10474-2-robertroyrose@gmail.com>
Message-ID: <20181129221226.2beef795@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 22:21:40 -0800, Robert Rose wrote:
> Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  .../0001-target-build-using-host-plugin.patch | 44 +++++++++++++++++++
>  package/grpc/Config.in                        | 11 +++++
>  package/grpc/grpc.hash                        |  5 +++
>  package/grpc/grpc.mk                          | 36 +++++++++++++++
>  6 files changed, 100 insertions(+)
>  create mode 100644 package/grpc/0001-target-build-using-host-plugin.patch
>  create mode 100644 package/grpc/Config.in
>  create mode 100644 package/grpc/grpc.hash
>  create mode 100644 package/grpc/grpc.mk

Thanks for this new iteration. However, it's a pity that you didn't
reuse any of the improvements I had, and which I suggested you to
re-use for your next iteration.

So, I redid the same changes, and also improved the description of
0001-target-build-using-host-plugin.patch which was really not
sufficient.

Here is the list of changes I did:

    [Thomas:
     - add missing Config.in dependencies inherited from
       BR2_PACKAGE_PROTOBUF, as well as the corresponding Config.in
       comment
     - replace spaces by tabs in grpc.mk indentation
     - remove superfluous GRPC_SOURCE variable
     - improved patch description.]

After those changes, I applied this patch to next. Thanks for your
contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
