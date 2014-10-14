From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 15 Oct 2014 02:01:02 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-13
In-Reply-To: <20141014063014.67756100ECC@stock.ovh.net>
References: <20141014063014.67756100ECC@stock.ovh.net>
Message-ID: <CAMo8BfJKAS3HJcb1M4wXWGkUMigGk4rQbzShGwQXWus0yFoowQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 14, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-10-13
>       xtensa | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/d3ac726110f98d87042ff883b2bc4366a2b45ff2/

Mysterious failure:

[ 85%] Building C object src/cpp/CMakeFiles/flann_s.dir/flann/ext/lz4hc.c.o
{standard input}: Assembler messages:
{standard input}:516330: Warning: partial line at end of file ignored
xtensa-buildroot-linux-uclibc-g++: internal compiler error: Killed
(program cc1plus)

couldn't reproduce locally.

-- 
Thanks.
-- Max
