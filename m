From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 09:41:27 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
	'manual-update-lists'
In-Reply-To: <20130312085945.7d595fb2@skate>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
 <20130312085945.7d595fb2@skate>
Message-ID: <CAHXCMMJMP5o34AAX29Rx0HqWOtysCz4bFJNrMo+pyHYBf0++fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/3/12 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Tue, 12 Mar 2013 05:47:15 +0100, Samuel Martin wrote:
>
>> +manual-update-lists:
>> +     @$(call MESSAGE,"Updating the manual lists...")
>> +     $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) \
>> +             $(TOPDIR)/support/scripts/gen-manual-lists.py
>
> Sorry if this has been discussed before. Why don't we make this part of
> the normal manual build process (make manual-pdf, make manual-html,
> etc.), so that we don't have to version control the generated lists of
> packages, and this updating of the lists is done automatically whenever
> we generate the manual?
I don't remember we discussed a lot this point.

I don't have a strong opinion about this, but since there is some
date/version in
the generated files (see patch 5/5), I don't want to bother people
with this insignificant
change just because they (re)build the manual...

Regards,

-- 
Samuel
