From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2020 14:20:02 +0100
Subject: [Buildroot] [PATCH] package/owfs: fixup Python sysconfigdata
 for per-package directories
In-Reply-To: <20200218133829.78d5dfef@windsurf>
References: <20200217235523.107701-1-thomas.petazzoni@bootlin.com>
 <7bf974a2-e1cb-4c34-2ad0-f0ac83d7279d@mind.be>
 <20200218133829.78d5dfef@windsurf>
Message-ID: <17169864-cd61-badd-353b-ad2415ae6f51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2020 13:38, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> On Tue, 18 Feb 2020 09:42:25 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>  Why is this needed for owfs and not for all the other python packages?
> 
> Well:
> 
>   https://patchwork.ozlabs.org/patch/1239695/
> 
> is doing exactly the same thing in the python-package infra for all
> other Python packages.

 Ha! Good that I asked, it seems my imap cache was corrupted or something...

 In that case: looks good to me. Or rather, feels like a hack but I don't have
any better ideas :-)

 Regards,
 Arnout
