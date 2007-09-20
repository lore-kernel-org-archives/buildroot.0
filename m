From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 19:25:40 +0200
Subject: [Buildroot] fakeroot fails to build
In-Reply-To: <20070920155047.GA8635@aon.at>
References: <46F29042.30908@asist.si> <20070920155047.GA8635@aon.at>
Message-ID: <20070920172540.GC8635@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 05:50:47PM +0200, Bernhard Fischer wrote:
>On Thu, Sep 20, 2007 at 05:22:42PM +0200, Babarovic Ivica wrote:
>> Hi!
>>
>> It seem fakeroot fails to build for my powerpc target.
>
>Please show me your
>$ egrep "^[^#]*(_GCC|LARGE|UCLIBC)" .config

fakeroot is broken if LFS is off. Enable largefile support and/or fix
fakeroot upstream.

HTH,
