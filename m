From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 16:30:50 -0300
Subject: [Buildroot] [PATCH 2/3] php: cleanup patches
In-Reply-To: <20150408212558.1e1d0266@free-electrons.com>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>	<1428507569-28044-2-git-send-email-gustavo@zacarias.com.ar>
 <20150408212558.1e1d0266@free-electrons.com>
Message-ID: <552581EA.7050606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 04:25 PM, Thomas Petazzoni wrote:
> Could you anyway try to submit the patches upstream? The iconv patch
> will probably need some rework, but it would generally been good to
> reduce the number of patches in Buildroot.
> 
> Nonetheless, patch applied, thanks!

I'll try, but i fully expect upstream to reject it on the base of
"automatic legacy compatibility" grounds (i.e. that's needed for solaris
or whatnot, and how people build it historically manually).
The biggest sticking point would be to get them to ditch the unsets,
they probably don't know why they have those in the first place.
Regards.
