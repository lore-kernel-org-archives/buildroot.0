From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Mon, 12 Oct 2015 10:55:12 -0600
Subject: [Buildroot] [PATCH 1/1] bash: add default bash settings
In-Reply-To: <20151010115403.7cf295f0@free-electrons.com>
References: <1444259824-6246-1-git-send-email-dvanarnem@cmlab.biz>
 <20151010115403.7cf295f0@free-electrons.com>
Message-ID: <561BE5F0.1020001@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/2015 03:54 AM, Thomas Petazzoni wrote:
> Dear David Van Arnem,
>
> On Wed,  7 Oct 2015 17:17:04 -0600, David Van Arnem wrote:
>> Settings that were bash-specific were previously removed from
>> system/skeleton/etc/profile.  This measn that users using bash no longer
>> get the "normal" bash prompt with [user at host dir]#/$, and only get #/$.
>> This commit adds back the bash-specific settings, but adds them to the
>> bash package so they are only used when bash is installed on the target
>> system.
>>
>> bash_profile.sh contains the variables, aliases, and color profile that
>> were previously in system/skeleton/etc/profile.  The changes to bash.mk
>> use a post-install hook to install bash_profile.sh to the target
>> filesystem, where it will later be sourced by /etc/profile when a bash
>> shell is started.
>>
>> Signed-off-by: David Van Arnem <dvanarnem@cmlab.biz>
>
> Thanks for your patch. Following the comments from Maxime Hadjinlian on
> your patch, I've marked it as "Changes Requested" in our patch tracking
> system. Please resubmit a new version of your patch that takes into
> account the comments made by Maxime. Thanks a lot!
>
> Thomas
>
Hi Thomas,

Can you instruct me on how to get Maxime's comments?  I do not see them 
in my emails from this list.

-- 
Thanks,
David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2416 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151012/215feaf3/attachment.p7s>
