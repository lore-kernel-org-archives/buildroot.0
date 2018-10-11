From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 20:38:52 +0200
Subject: [Buildroot] [PATCH] libcurl: add brotli optional dependency
In-Reply-To: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 00:41:44 +0300")
References: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
Message-ID: <875zy81g77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The brotli package has recently been added to Buildroot. Add brotli an
 > an optional dependency to libcurl to make the build consistent.

 > It turns out that libcurl configure script users pkg-config to figure
 > out link libraries only when --with-brotli is explicitly set. So this
 > also fixes static build failure.

 > Fixes:
 > http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/
 > http://autobuild.buildroot.net/results/233/23376d8653dea6361e42b0f17b6aaab3c14d99cf/
 > http://autobuild.buildroot.net/results/b19/b198db4b69e18e6d01ec95aae9c6096c1912dd9c/

 > Cc: Adrian Perez de Castro <aperez@igalia.com>
 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
