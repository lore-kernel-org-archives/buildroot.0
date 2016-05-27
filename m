From: Martin Kelly <martin@surround.io>
Date: Fri, 27 May 2016 16:08:01 -0700
Subject: [Buildroot] [PATCH] Config.in: wrap to column width 72
In-Reply-To: <20160527230450.10a646c2@free-electrons.com>
References: <1464298507-22817-1-git-send-email-martin@surround.io>
 <20160527230450.10a646c2@free-electrons.com>
Message-ID: <5748D351.9060302@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/27/2016 02:04 PM, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this patch. Looks good, except for one thing.
>
> On Thu, 26 May 2016 14:35:07 -0700, Martin Kelly wrote:
>
>> +	  Command to be used to extract a gzip'ed file to stdout.  zcat
>
> Why do you have two spaces after the . here ? Only one is enough.
>
> There are other occurrences of the same issue in the rest of the patch.
> Could you fix this and send an updated version?
>

Some of these cases are caused by my rewrapping accidentally adding a 
space. Other cases were already present prior to wrapping. For example:

-   Have a look on the kernel.org site for a list of mirrors, then enter
-   the URL to the base directory.  Examples:
+   Have a look on the kernel.org site for a list of mirrors, then
+   enter the URL to the base directory.  Examples:

Would you like me to fix up all ".  " --> ". " as well, or just fix the 
newly introduced ".  " ? I'm happy to do either way.
