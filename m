From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 12 Jun 2012 06:48:24 -0300
Subject: [Buildroot] [PATCH v3 2/6] target: add symbols for PowerPC cpu
 features
In-Reply-To: <4FD6DE65.8080103@mind.be>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-5-git-send-email-s.martin49@gmail.com>
 <4FD6DE65.8080103@mind.be>
Message-ID: <21f5fa71e486cd00a487bb6b6d201344@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-12 03:15, Arnout Vandecappelle wrote:

> On 06/10/12 13:46, Samuel Martin wrote:
>> +# PowerPC cpu features
>> +config BR2_POWERPC_CPU_G3
>> +	bool
>> +config BR2_POWERPC_CPU_G4
>> +	bool
>> +config BR2_POWERPC_CPU_G5
>> +	bool
>
>  I was expecting Altivec here, not the PowerPC CPU generations...  
> These CPU
> features are relevant mostly to allow libraries to select optimized 
> assembly
> code, and I don't see much use of G5-specific assembly.  And anyway, 
> the
> -mcpu options for a particular CPU are already passed by buildroot.
>
>  Regards,
>  Arnout

Also the G5 is 64-bit capable so one might expect some issues down the 
line since we're not ppc64-capable at the moment.
Regards.
