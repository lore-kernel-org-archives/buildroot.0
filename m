From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 18:44:08 +0200
Subject: [Buildroot] [PATCH] package/strace: fix nios2_sp_ptr definition
In-Reply-To: <0934c44f-6c2b-7b4a-ebe2-ced29de69bb9@mind.be>
References: <20170704163326.25583-1-romain.naour@smile.fr>
 <0934c44f-6c2b-7b4a-ebe2-ced29de69bb9@mind.be>
Message-ID: <f1677608-1081-52d2-7ec7-743b277ac27e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 18:41, Arnout Vandecappelle a ?crit :
> 
> On 04-07-17 18:33, Romain Naour wrote:
>> The patch [1] introduced in streace 1.17 use the old way to access SP
>> register as defined for kernel headers < 4.0.
>> The kernel headers for nios2 has been changed in commit [2].
>>
>> Use the new kernel header.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/b9f/b9fc25b82f3280872fe1593ac252a8529ba83576
>>
>> [1] https://github.com/strace/strace/commit/6117728aacf431a3e3c05761766c776874cc0861
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=92d5dd8cd6e2b211d32d8fbc6cf4b7470765a09f
> 
>  Really strange to hack around this way, but what do you expect with strace...
> 
>  What's the upstream status of the patch?

I just posted it on the list:
https://sourceforge.net/p/strace/mailman/message/35927467/

Best regards,
Romain

> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Regards,
>  Arnout
> 
>>
