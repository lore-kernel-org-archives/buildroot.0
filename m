From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 15:12:33 +0100
Subject: [Buildroot] [PATCHv3 1/2] udisks: bump to version 1.0.5
In-Reply-To: <20150902160921.2da365d0@free-electrons.com>
References: <1441191045-41925-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150902160921.2da365d0@free-electrons.com>
Message-ID: <55E703D1.408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/02/2015 03:09 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 2 Sep 2015 11:50:44 +0100, Vicente Olivert Riera wrote:
> 
>> +	# udisks needs libgudev which is provided by eudev. But, if you are
>> +	# using systemd, since they removed libgudev from it, you need to
>> +	# install the libgudev package to satisfy this dependency.
> 
> I think the wording is not quite good yet. The sentence "udisks needs
> libgudev which is provided by eudev" is wrong, because libgudev can
> also be provided by libgudev. What about instead:
> 
> 	# When eudev is used as the udev provider, libgudev is
> 	# automatically provided as it is part of eudev. However, when
> 	# systemd is used as the udev provider, libgudev is not
> 	# provided, and needs to be built separately. This is why we
> 	# select the libgudev package only if systemd is used.
> 
> (Or something along those lines, my english is not perfect, for sure).
> 
> Thomas
> 

your explanation looks better to me. Care to use --amend before pushing
the changes, please? :-P Or do you want me to send a v4 for this?

Regards,

Vincent.
