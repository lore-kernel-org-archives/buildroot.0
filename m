From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 22 Mar 2016 22:43:36 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix lsipc segfault
In-Reply-To: <20160322223645.6fe2d7af@free-electrons.com>
References: <1458680998-912-1-git-send-email-romain.naour@gmail.com>
 <20160322223645.6fe2d7af@free-electrons.com>
Message-ID: <56F1BC88.50900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas,

Le 22/03/2016 22:36, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue, 22 Mar 2016 22:09:58 +0100, Romain Naour wrote:
>> lsipc segfault when no option is given.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  ...don-t-free-shm-data-if-no-shm-id-is-found.patch | 42 ++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>  create mode 100644 package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch
> 
> Applied to master, thanks. Please submit upstream, of course.

Done:
http://marc.info/?l=util-linux-ng&m=145868160106644&w=2

Best regards,
Romain
> 
> Thanks,
> 
> Thomas
> 
