From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 8 Sep 2016 22:07:41 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-05
In-Reply-To: <87vay67mmy.fsf@dell.be.48ers.dk>
References: <20160906063035.18941102741@stock.ovh.net>
 <CAFOYHZD8bOuN_2ie0t3O8XJA1zBJck4=YiyCSEVp=iNpPc43dg@mail.gmail.com>
 <20160907112850.17240a82@free-electrons.com>
 <CAFOYHZA8sdf7ZFA-CKKSngLUrbKAj16xsswJ64r+JGgCUKjz9g@mail.gmail.com>
 <87vay67mmy.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZD-eeu5RN2Zh=ABAL16YgV1gB8Ok8qMnqvws611KOib7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 8, 2016 at 9:43 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
> Hi,
>
>  >> The line QSTRING_BLACK_LIST = {'NULL', 'number_of', } is defining a
>  >> set. It works in Python 2.7, but not in Python 2.6. I guess replacing
>  >> with:
>  >>
>  >> QSTRING_BLACK_LIST = set(['NULL', 'number_of'])
>  >>
>  >> should work fine (tested with 2.6, 2.7 and 3.5)
>
>  > So before I go down that path. Are we saying python >2.6 is required
>  > for buildroot? Or at least that is the expectation for the
>  > auto-builders.
>
> Yes - From docs/manual/prerequisite.txt:
>
> === Mandatory packages
>
> * Build tools:
> ..
> ** +python+ (version 2.6 or any later)
>

OK. I've submitted a version of Thomas' patch upstream
https://github.com/micropython/micropython/pull/2404.
