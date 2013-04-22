From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Apr 2013 16:09:07 -0300
Subject: [Buildroot] [PATCH 1/2] busybox: move patches to new model
In-Reply-To: <51757EF2.3060000@mind.be>
References: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
 <51757EF2.3060000@mind.be>
Message-ID: <51758AD3.9040207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2013 03:18 PM, Arnout Vandecappelle wrote:
>  I believe the idea was to have plain NNNN-xxxx.patch files (without
> package or version number) in the patch directories - like is the case
> already for gcc and gdb. But check the developer day report to be sure.
> 
>  And while you're at it, numbering the patches would be nice.

Historically the busybox patches were left untouched (simple wget, no
SoB and such).
If Peter is OK with following the standard i couldn't agree more and
send a V2 :)
Regards.
