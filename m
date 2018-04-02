From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Apr 2018 16:49:26 -0500
Subject: [Buildroot] [PATCH] libcurl: add brotli optional dependency
In-Reply-To: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
References: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
Message-ID: <CANQCQpaRQKY_XhJRtqtFgc+i7jaZw_p12gZ=_R47OYSdmOgiNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Mon, Apr 2, 2018 at 4:41 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> The brotli package has recently been added to Buildroot. Add brotli an
> an optional dependency to libcurl to make the build consistent.
>
> It turns out that libcurl configure script users pkg-config to figure
> out link libraries only when --with-brotli is explicitly set. So this
> also fixes static build failure.
>
> Fixes:
> http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/
> http://autobuild.buildroot.net/results/233/23376d8653dea6361e42b0f17b6aaab3c14d99cf/
> http://autobuild.buildroot.net/results/b19/b198db4b69e18e6d01ec95aae9c6096c1912dd9c/
>
> Cc: Adrian Perez de Castro <aperez@igalia.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>


Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
