From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 2 Dec 2016 06:25:27 +0100
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <CAMo8Bf+tDete50wsasrj=L1G=7XCJ9=dZBav4azY_PN1HTzrqw@mail.gmail.com>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
 <20161129094321.656d1cb4@free-electrons.com>
 <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
 <20161130050003.GS14207@waldemar-brodkorb.de>
 <CAMo8Bf+tDete50wsasrj=L1G=7XCJ9=dZBav4azY_PN1HTzrqw@mail.gmail.com>
Message-ID: <20161202052526.GB14207@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
Max Filippov wrote,

> Hello,
> 
> TL;DR: -static is good, order of objects in libc.a is important.

Thanks for the very detailed analysis.
Do you have any idea how we could restore the old order and keep
the binaries smaller?

best regards
 Waldemar
