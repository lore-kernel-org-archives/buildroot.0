From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 6 Aug 2015 20:51:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/empty - fix build failure
In-Reply-To: <20150806185956.GK8475@waldemar-brodkorb.de>
References: <1438703581-25996-1-git-send-email-brendanheading@gmail.com>
 <20150806185956.GK8475@waldemar-brodkorb.de>
Message-ID: <CA+BsyQ7y0gMfdHNsdFNjUzXDjFS-FUFOw+hbn9Wb0KrN-dCEMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 August 2015 at 19:59, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Threads are not required for SysV semaphores. I have sent a patch
> fixing the build with a toolchain without threads, but I got no
> response on that.
>
> http://patchwork.ozlabs.org/patch/493343/

Agreed, that looks like a much better solution.

Brendan
