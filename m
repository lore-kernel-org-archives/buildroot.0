From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:36:06 +0200
Subject: [Buildroot] [PATCH-2017.02.x] nodejs: security bump to version
 6.11.1
In-Reply-To: <87379zb1jv.fsf@dell.be.48ers.dk>
References: <20170713212631.22939-1-peter@korsgaard.com>
 <87379zb1jv.fsf@dell.be.48ers.dk>
Message-ID: <20170715113606.2fc0047a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 15:17:24 +0200, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:  
> 
>  > Fixes CVE-2017-1000381 - The c-ares function ares_parse_naptr_reply(), which
>  > is used for parsing NAPTR responses, could be triggered to read memory
>  > outside of the given input buffer if the passed in DNS response packet was
>  > crafted in a particular way.  This patch checks that there is enough data
>  > for the required elements of an NAPTR record (2 int16, 3 bytes for string
>  > lengths) before processing a record.  
> 
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>  
> 
> Committed to 2017.02.x, thanks.

For some reason, the status of this patch hadn't been updated to
"Accepted" in patchwork, so I've done so now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
