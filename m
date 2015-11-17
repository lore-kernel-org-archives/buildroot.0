From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 17 Nov 2015 11:13:02 +0000
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <56432ED3.7070008@mind.be>
References: <56432809.3000902@synopsys.com> <56432ED3.7070008@mind.be>
Message-ID: <564B0BBE.8050102@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your help!

On 11/11/2015 12:04 PM, Arnout Vandecappelle wrote:
> On 11-11-15 12:35, Joao Pinto wrote:
>> Hi,
>> We are designing the procedure to release our software stack based on buildroot.
>> Could you please tell what is the advised method for including a kernel patch
>> set in buildroot? I typically use BR2_LINUX_KERNEL_PATCH where I indicate each
>> patch file. Is there a easier way like using BR2_GLOBAL_PATCH_DIR for example?
> 
>  I personally prefer to use a git repository that includes the patches. During
> development, I make a local checkout specified with LINUX_OVERRIDE_SRCDIR; for
> release, I point to the repository (often on gitlab) and specify a tag.
> 
>  BR2_GLOBAL_PATCH_DIR and BR2_LINUX_KERNEL_PATCH are basically equivalent, you
> can specify a directory with the latter as well.
> 
> 
>  Regards,
>  Arnout
> 
>>
>> Thanks for your help!
>>
>> Joao
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> 
