From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 13 Jun 2008 15:33:10 +0200
Subject: [Buildroot] Still no answer for a contribution -- "me too"
References: <20080611161156.33737116@crazy><200806130824.42363.buildroot.atmel.com@pollet.net><87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
	<20080613120529.GB31396@cloud.net.au>
Message-ID: <006901c8cd5d$a0aca220$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Fri, Jun 13, 2008 at 12:07:42PM +0100, Will Newton wrote:
>> I must confess that has been my experience too. I tried asking Erik
>> for commit access but again, no response. Perhaps he is working on
>> other projects?
> 
> I think anyone wanting write access should send some patches here
> first for review. I guess you already did this -- I don't recall
> sorry. 
> 
> Personally even though I have commit access I think it is still good
> to discuss anything remotely controversial before committing it. Most
> changes (new packages, package updates) don't fall in that category of
> course.
> 
>> It's a hard balance to strike, I don't think it's right to demand
>> anything of people on a volunteer led project but some of us have a
>> job to do and a limited amount of time to do it in.
> 
> Does your job require your changes to be committed to the master
> repository?
> 
> Personally I am using buildroot in a commercial product for my day
> job. I am contributing everything that is relevant back to the
> buildroot repository, but we have some changes specific to our
> application and some proprietary packages which will never be merged.
> We don't expect to be able to build our whole product directly from
> the buildroot.uclibc.org repository.

I think this is fairly common.
That is why I proposed the "local" directory,
where the location can be defined as a shell environment variable.

BR2_LOCAL or something.

By putting your packages here, you should be able to download
a new svn and use it without modifications.

It was a lot of protests at that time, and it was never fully implemented.

The make saveconfig/getconfig uses the local directory.

I think that it would be easy to expand to have packages in this directory as well.

> 
> I'm committing my own changes back to the master repository where
> relevant, and I commit patches from this mailing list in areas that
> are relevant to me and where I think I can properly review them.
> Unfortunately I don't have company time to work on parts of buildroot
> that fall outside these categories.
> 
> Hamish

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57


Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/
