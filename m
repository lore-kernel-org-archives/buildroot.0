From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 01 Jan 2015 18:38:45 +0100
Subject: [Buildroot] [PATCH 2/2 try 2] sane-backends: Install into
	staging
In-Reply-To: <20150101165133.2d30b4b3@free-electrons.com>
References: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>	<54A2FFAE.30609@dawncrow.de>
 <20150101165133.2d30b4b3@free-electrons.com>
Message-ID: <54A58625.4060802@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Am 01.01.2015 um 16:51 schrieb Thomas Petazzoni:
> Dear Andr? Hentschel,
> 
> On Tue, 30 Dec 2014 20:40:30 +0100, Andr? Hentschel wrote:
>> Other packages might depend on sane, thus it should install it's development files.
>> I'm working on a clean Wine package and it wasn't able to find sane.
>>
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  package/sane-backends/sane-backends.mk | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Thanks, applied after slightly tweaking the commit log to remove
> "personal messages" such as "I'm working on ...".
> 
> Thanks!

Cool, thank you!
