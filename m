From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 6 Feb 2015 10:39:19 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-05
In-Reply-To: <20150206073016.6D6BC100E6C@stock.ovh.net>
References: <20150206073016.6D6BC100E6C@stock.ovh.net>
Message-ID: <CAMo8BfKt7HRRRtYJ-Hj_F858NPQ4ZER9nZ2f7pTaXVQn=UUGtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 6, 2015 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-02-05
>       xtensa |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4298ce40cbe3db50ffe53ecf6856523157df591d/

Fails with

ERROR: Unknown target name 'xtensa-linux-user'

because xtensa doesn't have linux-user support in QEMU.

-- 
Thanks.
-- Max
