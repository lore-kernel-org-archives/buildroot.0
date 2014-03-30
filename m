From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 30 Mar 2014 07:22:43 -0300
Subject: [Buildroot] [PATCH 2/2] libcgicc: bump to version 3.2.13
In-Reply-To: <20140330113051.5c43cc69@skate>
References: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>	<1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
 <20140330113051.5c43cc69@skate>
Message-ID: <5337F073.9040800@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/30/2014 06:30 AM, Thomas Petazzoni wrote:

> I've changed this to the more traditional:
> 
> 	LGPLv3+ (library), GFDL1.2+ (docs)
> 
> Though I'm wondering if:
> 
>  * We shouldn't use GFDLv1.2+ instead, like we do for GPL/LGPL.
> 
>  * Whether we should really worry about the documentation license,
>    since we don't allow the installation of the documentation on the
>    target. I don't think we have any other package that describe the
>    license of their documentation.
> 
> Cc'ing Luca and Yann to get an opinion on this.

At this point we nuke docs so +1 from me, i added it because i saw
COPYING.* included it and there was one other package that mentions the
FDL (valgrind).
But yeah, it won't be in staging or target any time soon so +1 about the
second point.
Regards.
