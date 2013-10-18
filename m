From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Oct 2013 16:01:19 +0200
Subject: [Buildroot] [PATCH] tslib: needs dynamic library for dlopen
In-Reply-To: <a0f5079cb28446c5d278.1382078683@argentina>
References: <a0f5079cb28446c5d278.1382078683@argentina>
Message-ID: <CAAXf6LX-5yWxuPS1xyv1L0fMoaW3SsY0KDdq0xHu+uWtkH-oMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 18, 2013 at 8:44 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Fixes
> http://autobuild.buildroot.net/results/1242cbea015e5a24a6621d1bd5569d2a1a819bb4/
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v2: - propagate dependency to selectors of tslib (ThomasP)
>     - shared library -> dynamic library (shame on me)
>

Sorry by the way that the subject line does not correctly mention v2.
