From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Tue, 27 May 2014 13:08:56 -0700
Subject: [Buildroot] [PATCH v5 9/9] powerpc: add powerpc64 and
	powerpc64le support
In-Reply-To: <87ha4cfhqi.fsf@dell.be.48ers.dk>
References: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399958901-7867-10-git-send-email-cody@linux.vnet.ibm.com>
 <87ha4cfhqi.fsf@dell.be.48ers.dk>
Message-ID: <5384F0D8.7010002@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2014 12:43 PM, Peter Korsgaard wrote:
>>>>>> "Cody" == Cody P Schafer <cody@linux.vnet.ibm.com> writes:
>
>   > This enables powerpc64 and powerpc64le. Currently, le needs at least
>   > glibc 2.19 and gcc 4.9.0. For gdb, 7.7.1 works (added in an earlier
>   > patch).
>
>   > Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
>
> [snip]
>
> It looks like you forgot gcc 4.8.x.

Actually, I ended up discovering in testing that gcc 4.8.2 has patches 
to support powerpc64le, but failed to update the patch description to 
reflect that :(

> Committed with that fixed (and some minor fixups to get it to apply) to next, thanks.
>
