From: Will Newton <will.newton@gmail.com>
Date: Wed, 1 Sep 2010 09:56:53 +0100
Subject: [Buildroot] libssp missing from target
In-Reply-To: <20100831200709.11d5a800@surf>
References: <i5j4vi$oj9$1@dough.gmane.org>
	<20100831200709.11d5a800@surf>
Message-ID: <AANLkTimmeDgV5FV3ow0vC8z40n=K5Ty9zP2HH9g7O0D+@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 31, 2010 at 7:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 31 Aug 2010 14:52:34 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I just added a package (systemtap) that uses libssp. ?I find libssp.so
>> et al. are present in output/staging/lib but missing from
>> output/target/lib. Is there something I need to do in my package
>> makefile to tell buildroot that my package needs libssp to be copied
>> from staging into target?
>
> What is libssp ? Who needs it (besides systemtap) and for what ?

I believe it's part of gcc, used for stack checking.
