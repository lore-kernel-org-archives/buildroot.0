From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 12 Dec 2017 10:35:24 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: fixes build of iio
 with 4.14+ kernels
In-Reply-To: <20171212073004.6f6d72e3@windsurf.png.is.keysight.com>
References: <1512733938-29854-1-git-send-email-julien.boibessot@free.fr>
 <20171212073004.6f6d72e3@windsurf.png.is.keysight.com>
Message-ID: <8efd7427-9096-bf58-0945-09e9fa3847a4@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/2017 07:30, Thomas Petazzoni wrote:
> Hello,
>
> On Fri,  8 Dec 2017 12:52:18 +0100, julien.boibessot at free.fr wrote:
>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> Since this commit [1], iio build has been moved to other linux-tools build
>> system. Installation dir is now given by DESTDIR, like for all other linux-tools.
>> I kept INSTALL_DIR env and 'install' target to be compatible with oldest
>> kernels.
>>
>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/tools/iio/Makefile?h=v4.14.4&id=18956cf2d78a8d4a5959e20240f04ce8d5a6c121
>>
>> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>> ---
>>  package/linux-tools/linux-tool-iio.mk.in | 2 ++
>>  1 file changed, 2 insertions(+)
> Applied to master after improving the commit log. Thanks!

Thanks Thomas, should I send the same for 2017.02 ?

Regards,
Julien
