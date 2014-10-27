From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 26 Oct 2014 23:44:58 -0300
Subject: [Buildroot] [PATCH] zlog: Add patch to remove -Werror
In-Reply-To: <20141026215222.1bf25872@free-electrons.com>
References: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20141026215222.1bf25872@free-electrons.com>
Message-ID: <544DB1AA.7070805@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/26/2014 05:52 PM, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Sun, 26 Oct 2014 16:34:39 -0300, Ezequiel Garcia wrote:
> 
>> +Instead of trying to fix the macro, let's fix the real issue here,
>> +and remove -Werror.
> 
> I actually think the real problem should also be fixed :)
> 

But which is the real problem: the BSD_SOURCE macro usage or the warning
in the toolchain?

Other architectures are not producing any warning, so this sounds like
yet another issue with the toolchain.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141026/edfe55cd/attachment.asc>
