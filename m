From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Mon, 4 Jan 2021 22:28:42 -0300
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: new package
In-Reply-To: <20210104211827.762fa2b8@windsurf.home>
References: <20201204141737.27942-1-klaus@linux.vnet.ibm.com>
 <20210102184224.13096374@windsurf>
 <12678409-b5dc-71fa-f0d1-9caf625f75c5@linux.vnet.ibm.com>
 <20210104211827.762fa2b8@windsurf.home>
Message-ID: <db85d292-4bf2-b9d5-c757-ad82e1360f44@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 1/4/2021 5:18 PM, Thomas Petazzoni wrote:
> Hello Klaus,
> 
  
> The locally computed sha256 is useful. What was not is the comment:
> 
> # locally calculated from http://.....tar.gz
> 
> because it's obvious from where it has been calculated, so we tend to say just:
> 
> # locally calculated
> 
> or, if indeed there was another verification method:
> 
> # locally calculated, after checking the signature with ...
> 
> Does that make sense? But really, this is very tiny minor detail.
> 
> Thomas

Ah, got it now. Thanks for the explanation!

  -Klaus


-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
