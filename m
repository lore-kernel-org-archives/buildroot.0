From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 11:28:33 +0100
Subject: [Buildroot] [PATCH v2] package/libcurl: rename curl binary
 config symbol
In-Reply-To: <c26bb4f7c24adf02f3260fafaa70536472d255e3.1581336419.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 10 Feb 2020 14:06:59 +0200")
References: <c26bb4f7c24adf02f3260fafaa70536472d255e3.1581336419.git.baruch@tkos.co.il>
Message-ID: <87ftfaj06m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Package optional or choice config symbols are usually prefixed with the
 > package config symbol name. Rename BR2_PACKAGE_CURL to
 > BR2_PACKAGE_LIBCURL_CURL to conform.

 > Update references to the old name.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > ---
 > v2:

 > Rebase on current master:

 >   * Move legacy entry to 2020.02

 >   * Handle glslsandbox-player select

I'm personally not super thrilled about the breakage in various custom
configs, but OK - It is indeed "odd" to have a suboption not prefixed
with _LIBCURL and nobody gave any negative feedback - So committed,
thanks.

-- 
Bye, Peter Korsgaard
