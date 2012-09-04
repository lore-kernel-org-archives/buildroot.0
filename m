From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 04 Sep 2012 15:05:01 -0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.63
In-Reply-To: <20120904180016.GC3768@tarshish>
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
 <20120904180016.GC3768@tarshish>
Message-ID: <504642CD.3030106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/12 15:00, Baruch Siach wrote:

>> +DNSMASQ_LICENSE = GPLv2 GPLv3
> 
> Looks confusing. Is it "either v2 or v3"? If so, then I think
> 
> DNSMASQ_LICENSE = Dual GPLv2/GPLv3
> 
> would be better.
> 
> baruch

Hi.
They specify (in not so clear terms) that you can choose one of them,
see CHANGELOG.archive line 2393.
I'm pretty short of sleep these days, "Dual" would be choose either or
both apply?
Regards.
