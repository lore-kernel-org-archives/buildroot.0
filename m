From: Jeroen Roovers <jer@airfi.aero>
Date: Thu,  3 Nov 2016 11:39:34 +0100
Subject: [Buildroot] [PATCH 0/2] libcurl: Incorrect fix for CVE-2016-8625
In-Reply-To: <20161102162525.22840817AD@busybox.osuosl.org>
References: <20161102162525.22840817AD@busybox.osuosl.org>
Message-ID: <20161103103936.9102-1-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2016-8625 (IDNA 2003 makes curl use wrong host) was fixed by switching from
libidn to libidn2.
