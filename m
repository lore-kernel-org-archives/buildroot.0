From: W.P. <laurentp@wp.pl>
Date: Tue, 13 Oct 2009 00:50:38 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <20091012203645.GX2266@mx.loc>
References: <4AD389B2.20400@wp.pl> <87my3w4bw6.fsf@macbook.be.48ers.dk>
	<4AD3918B.5000908@wp.pl> <20091012203645.GX2266@mx.loc>
Message-ID: <4AD3B2BE.2010809@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Bernhard Reutner-Fischer napisa?:
> On Mon, Oct 12, 2009 at 10:28:59PM +0200, W.P. wrote:
>   
>> U?ytkownik Peter Korsgaard napisa?:
>>     
>>>>>>>> "W" == W P <laurentp@wp.pl> writes:
>>>>>>>>             
>>>>>>>>                 
>>>  W> Hi,
>>>  W> how can I set up CURRENT buildroot to use OLD gcc/binutils/kernel/uClibc?
>>>  W> I need gcc 3.4.4, kernel 2.6.12.6-venus, uClibc 0.9.28?
>>>
>>> Some older toolchain versions are available if you enable BR_DEPRECATED
>>> (Build options->Show packages that are deprecated or obsolete). It won't
>>> give you those exact options, but it might be close enough.
>>>
>>>   
>>>       
>> Almost :(
>>
>> With choosing this option I am able to select gcc down-to 3.4.6,
>> binutils 2.17, uClibc 0.9.28.3, kernel 2.6.2x ...
>>
>> Could you point me to the file where are these choices are in? If I know
>> in what file, then adding an option ex. to gcc 3.4.4 instead of 3.4.6
>> should be easy...
>>     
>
> not really since you have to patch it.
> See toolchain/gcc/Config.in
>
> I'm curious why you think you need a compiler that is so full of
> bugs compared to let's say the current 4.x series?
>   

There is a system (Manta "Multimedia Recorder" HDD-2000 = Shenzen Mele
HMC-35HD) that was build using (i am almost sure after several hours of
googling) using those versions of tools. And binutils: 2.16 or even
2.15. I want to be able to build some kernel modules, so (correct me if
I am wrong) I need EXACT versions of tools/configure options to do so.

BTW It looks crazy, those Chinese/Taiwanese developpers (Mele, Edimax,
maybe others) seems to be TIED to gcc 3.4.4(3).....
(look at published Edimax toolchains for BR-6204Wg, BR-6104KP...)

BTW2: looks Manta(Poland) violates GPL.... : there is NO mention about
sources on their web.

W.P.
