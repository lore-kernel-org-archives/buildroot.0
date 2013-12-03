From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Dec 2013 11:13:42 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-02
In-Reply-To: <529DE4FE.8020900@imgtec.com>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
 <529DE4FE.8020900@imgtec.com>
Message-ID: <529DE716.1000205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2013 11:04 AM, Vicente Olivert Riera wrote:

> On 12/03/2013 07:30 AM, Thomas Petazzoni wrote:
>> Build statistics for 2013-12-02
>> ===============================
> 
>> Detail of failures
>> ===================
> 
>>        mips |                 aiccu-20070115 | NOK |
>> http://autobuild.buildroot.net/results/d05e23031ea5542610c26c89908ae64c741fd330/
>>
> 
> This failure is caused by another failure on gnutls package. This
> problem has already fixed upstream so it will be available on the next
> gnutls release:
> https://gitorious.org/gnutls/gnutls/commit/346e323228f5cc71664c2f49541f816f88914342

My fault for bumping gnutls :)
I'm waiting for a new release since the patchset is big, otherwise it
can be reverted to 3.2.6 since it's not a security bump.
Regards.
