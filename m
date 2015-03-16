From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Mar 2015 01:02:28 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-15
In-Reply-To: <20150316073020.6611C100E85@stock.ovh.net>
References: <20150316073020.6611C100E85@stock.ovh.net>
Message-ID: <CAMo8BfKuPTASXR9JEx=aGctfNxNcr2PDewyS+GGt6jcbeY8dbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 16, 2015 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>       xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/90c318e3a9ef5e626d0a80e36695d34eda21f97e/
>       xtensa |               memcached-1.4.22 | NOK | http://autobuild.buildroot.net/results/cd8e9d9a5f454c321071c21192958aeee9c39e73/

Caused by disabled UCLIBC_HAS_GNU_GETSUBOPT option in the uclibc config.
Also reproducible with other architectures that use uclibc.
I guess we can just enable it in the config, additional code is really small.

-- 
Thanks.
-- Max
