From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 13:23:49 +0000
Subject: [Buildroot] [PATCH next] wireshark: bump version to 2.2.2
In-Reply-To: <581f8f78d4929e4ac974ec9f092fd51b@zacarias.com.ar>
References: <20161117105816.28484-1-Vincent.Riera@imgtec.com>
 <581f8f78d4929e4ac974ec9f092fd51b@zacarias.com.ar>
Message-ID: <d2f8279f-6847-76f1-9c0e-2486ffbbd85e@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 17/11/16 12:19, Gustavo Zacarias wrote:
> On 2016-11-17 07:58, Vicente Olivert Riera wrote:
> 
>> Release notes:
>>   https://www.wireshark.org/docs/relnotes/wireshark-2.2.2.html
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Hi Vicente.
> s/next/master/ since it's security as well, sorry :-)
> Wireshark normally has their own internal security IDs (WNPAs) which may
> later on get matching CVEs (or not).

Thanks for the info!

I read the release notes, the oss mailing list and I didn't found any
recent CVE for it. I saw some changes that looked like security fixes to
me, but I wasn't sure.

I'll try to track Wireshark's WNPAs as well.

Regards,

Vincent

> Regards.
