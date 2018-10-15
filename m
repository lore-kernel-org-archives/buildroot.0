From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 15 Oct 2018 00:31:44 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-14
In-Reply-To: <20181015060028.2292320728@mail.bootlin.com>
References: <20181015060028.2292320728@mail.bootlin.com>
Message-ID: <CAMo8Bf+c9cYqa_rduvsVHCrVrXC_8-6mt-B0-TLHJRmboHU3JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 14, 2018 at 11:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>       xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/586adbd49ca1deb8116f2da04ab04069f3048536 | ORPH

Has the following in the build-end.log:
> collect2: error: ld returned 1 exit status
> Makefile:108: recipe for target 'imagescaling' failed
> make[4]: *** [imagescaling] Error 1

so I took a look at it, but surprisingly I couldn't reproduce it.

-- 
Thanks.
-- Max
