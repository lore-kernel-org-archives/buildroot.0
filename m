From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 19 Mar 2013 22:52:11 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
	'manual-update-lists'
In-Reply-To: <20130313083959.49853d83@skate>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
 <20130312085945.7d595fb2@skate>
 <CAHXCMMJMP5o34AAX29Rx0HqWOtysCz4bFJNrMo+pyHYBf0++fg@mail.gmail.com>
 <20130313083959.49853d83@skate>
Message-ID: <CAHXCMMJenyhQiKPp+vKbcM_c280ghGVeAG9tsGxtXnR0s3b0CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/3/13 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Tue, 12 Mar 2013 09:41:27 +0100, Samuel Martin wrote:
>
>> I don't have a strong opinion about this, but since there is some
>> date/version in
>> the generated files (see patch 5/5), I don't want to bother people
>> with this insignificant
>> change just because they (re)build the manual...
>
> I'm not sure to understand the problem with the dates. I'd say you
> shouldn't put the date specifically in the list of packages. I would
> expect "make manual-pdf" to generate the list of packages with your
> script, get it included into the manual sources, and get the manual
> built.
>
> Separately, we may want to introduce something at the beginning of the
> manual that says at which date the manual was built, and on which Git
> version of the Buildroot sources. But I don't see a reason to make this
> related to the list of packages specifically.
Just to be sure, here, you mean something like a non-versioned version.txt file,
which would be automatically generated and included in manual.txt?


Regards,

-- 
Samuel
