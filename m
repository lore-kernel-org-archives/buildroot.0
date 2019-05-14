From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2019 21:50:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5multimedia: fix build with
 gstreamer 0.10
In-Reply-To: <20190512132627.18937-2-fontaine.fabrice@gmail.com>
References: <20190512132627.18937-1-fontaine.fabrice@gmail.com>
 <20190512132627.18937-2-fontaine.fabrice@gmail.com>
Message-ID: <c035d344-0dff-f375-04d2-10ae4c82b8b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 12/05/2019 15:26, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/de26fd4f5ab130bd87ea9d7709d9568290362758
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-compile-failure-with-gstreamer-0-10.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch

 Does this patch apply both to 5.6 and 5.12?

 Note that we don't need a patch for 5.6, since it's excluded in qt5base. And
both Qt5.6 and gstreamer0.10 will be removed soonish, so there's no need to go
and re-enable it for 5.6. But I just want to avoid a build failure for 5.6
because the patch doesn't apply.

 Regards,
 Arnout
