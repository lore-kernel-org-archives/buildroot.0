From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Jun 2017 10:30:49 +0200
Subject: [Buildroot] [Bug 9921] lockfile module within python-daemon not
	available
In-Reply-To: <CAGm1_ku5oFE63i1Bw0sauh4kkqjPTaw+Vm16vkH_vphd52P=7Q@mail.gmail.com>
References: <bug-9921-163@https.bugs.busybox.net/>
 <bug-9921-163-jxbdEKNOIc@https.bugs.busybox.net/>
 <CAGm1_ku5oFE63i1Bw0sauh4kkqjPTaw+Vm16vkH_vphd52P=7Q@mail.gmail.com>
Message-ID: <CAGm1_kuPSCuBb9CRwhuFSA-gm5V4Q8YZgBGTfnx+L+ABnDFFhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 9, 2017 at 10:17 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Reto,
>
> On Wed, May 31, 2017 at 9:39 PM,  <bugzilla@busybox.net> wrote:
>> https://bugs.busybox.net/show_bug.cgi?id=9921
>>
>> --- Comment #2 from Reto Rayen <reto.rayen@outlook.com> ---
>> Hi Thomas
>>
>> i did find in addition that "thread" is also not included. Which is needed by
>> lockfile.
>
> https://pypi.python.org/pypi/lockfile/0.12.2 is unfortunately
> deprecated and according to [1] broken as well. According to the new
> python-daemon version runner.py is going to be deprecated [2]. Can you
> try to update python-daemon and avoid using runner.py?
>
> [1] https://pagure.io/python-daemon/issue/4
> [2] https://pagure.io/python-daemon/c/f25678cacc8cd1fbb8a28c196e8fe2eed291146c?branch=master

Adding Reto in CC
