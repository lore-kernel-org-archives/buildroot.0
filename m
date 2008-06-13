From: =?ISO-8859-1?Q?Knut-H=E5vard_Aksnes?= <kna@tirsdagsklubben.nu>
Date: Fri, 13 Jun 2008 18:54:25 +0200
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <20080613120529.GB31396@cloud.net.au>
References: <20080611161156.33737116@crazy>	<200806130824.42363.buildroot.atmel.com@pollet.net>	<87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
	<20080613120529.GB31396@cloud.net.au>
Message-ID: <4852A641.9060101@tirsdagsklubben.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Fri, Jun 13, 2008 at 12:07:42PM +0100, Will Newton wrote:
>   
>> I must confess that has been my experience too. I tried asking Erik
>> for commit access but again, no response. Perhaps he is working on
>> other projects?
>>     
>
> I think anyone wanting write access should send some patches here first
> for review. I guess you already did this -- I don't recall sorry.
>
> Personally even though I have commit access I think it is still good to
> discuss anything remotely controversial before committing it. Most
> changes (new packages, package updates) don't fall in that category of
> course.
>
>   
>> It's a hard balance to strike, I don't think it's right to demand
>> anything of people on a volunteer led project but some of us have a
>> job to do and a limited amount of time to do it in.
>>     
>
> Does your job require your changes to be committed to the master
> repository?
>
> Personally I am using buildroot in a commercial product for my day job.
> I am contributing everything that is relevant back to the buildroot
> repository, but we have some changes specific to our application and
> some proprietary packages which will never be merged. We don't expect to
> be able to build our whole product directly from the
> buildroot.uclibc.org repository.
>
> I'm committing my own changes back to the master repository where
> relevant, and I commit patches from this mailing list in areas that are
> relevant to me and where I think I can properly review them.
> Unfortunately I don't have company time to work on parts of buildroot
> that fall outside these categories.
>   
I am in a similar situation to many of the other contributors to this 
list. I am working as consultant mostly for a local customer. As long as 
my bug reports and patches are related to
the product development I am doing I can spend some paid time for the 
common good. My last project was porting of a customer specific firewall 
from a RedHat derivative to a buildroot based platform. My current 
project is an attempt to port firefox-3.0 to  DirectFB on a customer 
specific card. The processor on this card is  a mipsel based "system on 
a chip".

For both these projects parts of what I do is of general interest and 
fixes should be done in buildroot, other parts are customer specific and 
will probably of little interest for most other companies.

What's important for me is speed and quality :-)

Personally I would like to have subversion commit access to be able to 
speed up obvious bug-fixes, but I will at the same time try to avoid 
making a mess of the repository.
Obvious fixes, like missing dependencies or faulty configuration 
parameters can be fixed directly on trunk if they are well tested 
locally and unlikely to cause regressions in other builds. More tricky 
or larger fixes, like introducing new packages or upgrading major 
versions of several interdependent packages at the same time can be done 
in their own feature branches. Anybody with access to the repository can 
test and review these changes. If the fix(es) are accepted the feature 
branch is merged back into trunk and deleted. Creating merging and 
deleting branches are cheap operations in subversion.




-------------- next part --------------
A non-text attachment was scrubbed...
Name: kna.vcf
Type: text/x-vcard
Size: 507 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080613/7e248ed0/attachment.vcf 
