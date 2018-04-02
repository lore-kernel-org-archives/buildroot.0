From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 00:29:00 +0200
Subject: [Buildroot] [PATCH] libcurl: add brotli optional dependency
In-Reply-To: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Apr 2018 00:41:44 +0300")
References: <13524327ea113de73f2201143641c0dfcaa50d30.1522705304.git.baruch@tkos.co.il>
Message-ID: <87y3i5jl8z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The brotli package has recently been added to Buildroot. Add brotli an
 > an optional dependency to libcurl to make the build consistent.

 > It turns out that libcurl configure script users pkg-config to figure

s/users/uses/

Committed, thanks.

-- 
Bye, Peter Korsgaard
