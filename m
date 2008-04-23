From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 23 Apr 2008 19:03:36 +0200
Subject: [Buildroot] Improper device nodes
	createdinsideproject_build_arm/uclibc/root/dev/
References: <16803332.post@talk.nabble.com><20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com><20080422005042.GA19794@cloud.net.au><8763uaqs3b.fsf@macbook.be.48ers.dk><20080422095909.GA31643@cloud.net.au><040301c8a49d$c1408170$050514ac@atmel.com><87tzhtoihz.fsf@macbook.be.48ers.dk><044f01c8a4a9$cfed41c0$050514ac@atmel.com><87hcdtobni.fsf@macbook.be.48ers.dk>
	<d6cda7730804221745r419a43dft863faddfd681aba7@mail.gmail.com>
Message-ID: <016401c8a564$106164b0$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>I have my own script for that, formats the sdcard, mounts it and
> extracts the tar.
> 
> One could have a similar script in ~/buildroot/scripts for that, like
> the one we have for the ext3 images. Then just point it out, no need
> to have it on the make targets.
> 

You could generate scripts to build all packages...

Then you can remove ALL package/*/*.mk.

I do not think this is an improvement.

Why is it better to run a script than to be able to configure to
generate an SD-Card as part of the make?

>>  Hi,
>>
>>   Ulf> Using the tarball is a manual process.
>>   Ulf> Manual processes are error-prone.
>>
>>  Well, if you can type make, then you can probably also type tar xvf
>>
>>   Ulf> I agree that it is dangerous though, and needs to be carefully
>>   Ulf> thought through.
>>
>>  I still think it's needless bloat.

Do you generate SD-Cards images or not?
Have a feeling you here define bloat as something you do not use.

Best Regards
Ulf Samuelsson
