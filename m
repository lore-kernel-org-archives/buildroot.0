From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Dec 2010 15:18:27 -0300
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <4D18D7B3.3020900@zacarias.com.ar>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
Message-ID: <4D18D873.9010502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/27/10 15:15, Gustavo Zacarias wrote:

> On 12/27/10 15:15, ANDY KENNEDY wrote:
> 
>> After doing a:
>> git clone git://repo.or.cz/buildroot-gz.git
>>
>> I get worse results.  There are no dependencies for gmp now in the
>> toolchain for the target (IIRC, the previous version does select gmp
>> when target tool chain is selected -- though, that was last Thursday and
>> minus christmas eve, I've slept since then).  The toolchain is still not
>> required for building oprofile, though it does attempt to build it.
>>
>> Did I perhaps use git incorrectly to not get the correct changes you
>> mentioned?  The gmp version was still 4.2.4 and I could find no place in
>> the config to change it to 5.0.1.
>>
>> Thanks,
>> Andy
> 
> git clone git://repo.or.cz/buildroot-gz.git toolchain-rework
> is the correct syntax, otherwise you're just cloning my master repo
> which is basically buildroot master, hence the same as cloning from
> buildroot or getting a snapshot :)
> Regards.

Oh my bad, summer temperatures are killer today and i'm still sleepy
from a very festive weekend...
git clone git://repo.or.cz/buildroot-gz.git -b toolchain-rework
:)
