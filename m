From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Tue, 5 Nov 2019 11:50:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 3.2.1
In-Reply-To: <20191104220147.6b9ac9c2@windsurf.home>
References: <20191104131237.27902-1-patrick.havelange@essensium.com>
 <20191104220147.6b9ac9c2@windsurf.home>
Message-ID: <e773c862-6bc0-b71b-342c-d85f4ba7a29d@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04.11.19 22:01, Thomas Petazzoni wrote:
> On Mon,  4 Nov 2019 14:12:37 +0100
> Patrick Havelange <patrick.havelange@essensium.com> wrote:
> 
>> Some lxc segfaults (in 3.1.0) are fixed in this newer version.
>> New dependency on !UCLIBC as fexecve() is required now.
>>
>> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
>> ---
>>   package/lxc/Config.in | 6 ++++--
>>   package/lxc/lxc.hash  | 2 +-
>>   package/lxc/lxc.mk    | 2 +-
>>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks. Could you report the bug to the upstream
> uClibc-ng project that lxc can't be built/used anymore due to fexecve()
> being missing ?

Done, https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/issues/5

> 
> Thanks,
> 
> Thomas
> 
