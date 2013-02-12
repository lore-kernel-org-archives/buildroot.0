From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 12 Feb 2013 10:35:02 +0000
Subject: [Buildroot] [PATCH] vim: Add option to remove documentation
	from target
In-Reply-To: <20130212113010.014297ac@skate>
References: <1360664095-16562-1-git-send-email-markos.chandras@gmail.com>
 <20130212113010.014297ac@skate>
Message-ID: <CAG2jQ8hkN+TDA5EPYtbxOLk_AQxMx=imBW=_m0bJq_yiMrKuaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 February 2013 10:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Tue, 12 Feb 2013 10:14:55 +0000, Markos Chandras wrote:
>
>> +config BR2_PACKAGE_VIM_REMOVE_DOCS
>> +     bool "remove documentation"
>> +     default y
>> +     depends on BR2_PACKAGE_VIM
>> +     help
>> +       Remove documentation files from the target.
>> +       This option removes about 5.6MB of data from /usr/share/
>
> Please don't add a special option for this: use BR2_HAVE_DOCUMENTATION
> instead.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Hi Thomas,

Thanks for the reply. This BR2_HAVE_DOCUMENTATION option is marked as
"deprecated" so I was not sure if we should use it anymore or not. I
will prepare a new patch.

-- 
Regards,
Markos Chandras
