From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 1 Mar 2015 22:13:45 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
In-Reply-To: <20150228203451.57206a8d@free-electrons.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <20150228203451.57206a8d@free-electrons.com>
Message-ID: <CAAXf6LWsMp3-wNnfaBZLEPOPaFW4HXMaHTV8dycMehkqZkExjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 28, 2015 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 12 Dec 2014 21:04:45 +0100, Thomas De Schampheleire wrote:
>
>> This series against the buildroot-test repo makes some improvements to the
>> autobuild-run script.
>
> I've finally taken some time to test this series, and I've reported two
> separate problems as replies to e-mails: the make-opts split() issue,
> and the merging of argument vs. configuration file values.
>
> To avoid duplicate work, I've pushed the current state of your work
> (with the fix to the merging order, and the multiprocessing.Process
> fix) to:
>
>    git://git.free-electrons.com/users/thomas-petazzoni/buildroot-test.git
>
> in a branch called 'thomas-ds'.
>
> Since both issues are more or less tied to the docopt migration, can
> you have a look at them, and maybe simply propose followup patches that
> I can merge back into the problematic commits, to fix those issues?

Thanks for looking into this.
As replied on both mails, the make-opts split() issue is AFAICS not
present in the original code, but the multiprocessing error was a big
mistake by me.

I have sent two follow-up patches based on your branch. The first one
solves the argument handling priority issue you mentioned, while the
second one is a forgotten change in one of the earlier patches, as I
had mentioned before.

Let me know if I can address other issues.

Best regards,
Thomas
