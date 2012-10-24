From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Oct 2012 07:50:03 -0300
Subject: [Buildroot] [PATCH 09/12] nfacct: add new package
In-Reply-To: <5086CEA2.20407@mind.be>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-9-git-send-email-gustavo@zacarias.com.ar>
 <5086CEA2.20407@mind.be>
Message-ID: <5087C7DB.9050709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/23/12 14:06, Arnout Vandecappelle wrote:

> On 22/10/12 14:46, Gustavo Zacarias wrote:
>> +    depends on BR2_LARGEFILE
>> +    select BR2_PACKAGE_LIBNETFILTER_ACCT
> 
>  Is the largefile because of the libnetfilter_acct?  IOW, can it be removed
> after Yann's _AVAILABLE patch?
> 
>  Regards,
>  Arnout

Half yes, the basic culprit is libmnl.
It should be a good candidate for LIBMNL_AVAILABLE after Yann's patch, yup.
Regards.
