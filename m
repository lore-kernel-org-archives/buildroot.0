From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:27:42 +0100
Subject: [Buildroot] [PATCH v3] python3: Bump version to 3.6.1
In-Reply-To: <20170323152112.25631-1-andrew.smirnov@gmail.com>
References: <20170323152112.25631-1-andrew.smirnov@gmail.com>
Message-ID: <20170325152742.70d6c184@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 08:21:12 -0700, Andrey Smirnov wrote:
> Update all appropriate version numbers as well as SHAs and MD5s as well
> as repbasing BR's patches on top of 3.6.1 codebase (new github repo
> tree, v3.6.1 tag was used). Note that patch:
> 
>    [PATCH] Change the install location of _sysconfigdata.py
> 
> was dropped due to the fact taht build system now adds platform
> specific suffix to sysconfigdata's name, so each platform's file
> should have a unique name and distutils now allows to specify which
> sysconfigdata is used via _PYTHON_SYSCONFIGDATA_NAME
> 
> see:
> 
>     https://github.com/python/cpython/commit/c4b53afce491142b80b228a21a05de5dcfd8d36f
>     https://github.com/python/cpython/commit/92dec548ff1494b86f08bd3753ca91a9330b4ea9
> 
> and patches:
> 
>     [PATCH] distutils/sysconfig: use sysconfigdata
>     [PATCH] setup.py: do not add invalid header locations
>     [PATCH] Do not harcode invalid path to ncursesw headers
> 
> was dropped since it looks like it made it's way upstream, see:
> 
>     https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
>     https://github.com/python/cpython/commit/1351c31aa9651b278d7ef8ec79af3b646a520235
>     https://github.com/python/cpython/commit/e13c3201fb66c4c211b4ebb7604d1435bedc1015
> 
> respectively.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
